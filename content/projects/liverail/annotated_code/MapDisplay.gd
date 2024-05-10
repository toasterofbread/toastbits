extends Node2D
class_name MapDisplay

const SCALE: float = 0.01

@onready var map_node: Node = $Map

var map: Map = null
var rail_segment_lines: Array[RailSegmentLine] = []

var timetable: TT.Timetable = null
var timetable_stations: Dictionary = null # [ TT.Station, MapNode ]

var time_thread: Thread = null
var time_s: float = null
var train_positions: Dictionary = {} # [ TT.TrainService, Vector2 ]

"""
Sets the time used by the update thread and queues a redraw
The update thread is started if not already running
"""
func setTime(time_s: float):
	if self.time_s == null:
		self.time_s = time_s

		time_thread = Thread.new()
		time_thread.start(_trainPositionUpdateLoop)
	else:
		self.time_s = time_s

	queue_redraw()

"""
Adds RailSegmentLines and station previews matching the passed map
Nodes previously added by this function are removed
"""
func setMap(map: Map):
	self.map = map

	rail_segment_lines.clear()
	for child in map_node.get_children():
		child.queue_free()

	if map == null:
		return

	for rail_line in map.rail_lines:
		for rail_segment in rail_line.segments:
			if rail_segment.names.is_empty():
				continue

			var line: RailSegmentLine = RailSegmentLine.new()
			line.applyRailSegment(rail_segment, rail_line)

			rail_segment_lines.append(line)
			map_node.add_child(line)

		for station in rail_line.stations:
			var sprite = Sprite2D.new()
			sprite.texture = preload("res://icon.svg")
			sprite.global_position = station.pos * 0.01
			sprite.scale = Vector2.ONE * 0.05
			map_node.add_child(sprite)

"""
Sets the timetable to be used by the train position update thread
Must be called after setMap
"""
func setTimetable(timetable: TT.Timetable):
	self.timetable = timetable
	if timetable == null:
		timetable_stations = null
		return

	assert(map != null)

	timetable_stations = {}

	for rail_line in map.rail_lines:
		for station in rail_line.stations:
			var timetable_station: TT.Station = null
			for name in [station.name] + station.names.values():
				for st in timetable.stations:
					if st in name or name in st:
						timetable_station = timetable.stations[st]
						break
				if timetable_station != null:
					break

			if timetable_station == null:
				push_error("No timetable station found for ", station)
				return

			timetable_stations[timetable_station] = station

func _ready():
	$Camera2D.ZoomLevelChanged.connect(onCameraZoomLevelChanged)

func _exit_tree():
	if time_thread != null:
		time_s = null
		time_thread.wait_to_finish()
		time_thread = null

func _process(delta: float):
	if Input.is_action_just_pressed("click"):
		_onClick()

func onCameraZoomLevelChanged(zoom_level: float):
	for line in rail_segment_lines:
		line.onCameraZoomLevelChanged(zoom_level)

func _draw():
	for position in train_positions.values():
		if position == null:
			break
		draw_circle(position * MapDisplay.SCALE, 3, Color.WHITE)

func _onClick():
	var mouse_position: Vector2 = get_global_mouse_position()

	var touching: Array[RailSegmentLine] = []
	for line in rail_segment_lines:
		if line.isTouchingCursor():
			touching.append(line)

	if touching.is_empty():
		return
	if touching.size() == 1:
		_onRailSegmentLineClicked(touching[0])
		return

	var closest: RailSegmentLine = null
	var closest_distance: float = null

	for line in touching:
		var distance = line.getTouchingCursorDistance(mouse_position)

		if closest == null || distance < closest_distance:
			closest = line
			closest_distance = distance

	_onRailSegmentLineClicked(closest)

func _onRailSegmentLineClicked(rail_segment_line: RailSegmentLine):
	print(rail_segment_line.rail_segment.names)

func _trainPositionUpdateLoop():
	while true:
		var time_s: float = self.time_s
		if time_s == null:
			break

		self.train_positions = TrainPosition.calculateMapTrainPositions(
			time_s, map, timetable, timetable_stations
		)
