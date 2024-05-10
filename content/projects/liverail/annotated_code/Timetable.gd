class_name TT

class Timetable:
	var stations: Dictionary = {}
	var trains: Array[TrainService] = []

	func _to_string():
		return "Timetable(len(stations)=%d, len(trains)=%d)" % [len(stations), len(trains)]

class Station:
	var name: String
	var schedule: Dictionary # [TrainService, Stop]

	func _to_string():
		return "Station(name=%s)" % name

class Stop:
	var station: Station
	var arrival: float
	var departure: float

	func _to_string():
		return "Stop(arrival=%s, departure=%s)" % [TT.secondsToText(arrival), TT.secondsToText(departure)]

class TrainService:
	var type: Type
	var train_class: TrainClass
	var stops: Array[Stop]

	func getPosition(time_s: float, shouldIgnoreStop: Callable = func(it): false) -> TrainPosition:
		return TrainPosition.calculateTrainPosition(self, time_s, shouldIgnoreStop)

	func _to_string():
		return "TrainService(len(stops)=%d)" % len(stops)

	enum Type {
		LOCAL,
		REGIONAL_LOCAL,
		SEMI_EXPRESS,
		EXPRESS,
		COMMUTER_EXPRESS,
		LTD_EXPRESS,
		COMMUTER_LTD_EXPRESS,
		DIRECT_EXPRESS
	}

class TrainClass:
	var name: String
	var maximum_speed: float
	var acceleration: float
	var deceleration: float

static func loadTimetableFile(file: FileAccess, timetable: Timetable):
	var data: Array = JSON.parse_string(file.get_as_text(true))

	for item in data:
		var train: TrainService = TrainService.new()
		timetable.trains.append(train)

		match item["train"]["type"]:
			"普通":
				train.type = TrainService.Type.LOCAL
			"区間普通":
				train.type = TrainService.Type.REGIONAL_LOCAL
			"準急", "準特急":
				train.type = TrainService.Type.SEMI_EXPRESS
			"急行":
				train.type = TrainService.Type.EXPRESS
			"通勤急行":
				train.type = TrainService.Type.COMMUTER_EXPRESS
			"特急", "山陽Ｓ特急":
				train.type = TrainService.Type.LTD_EXPRESS
			"通勤特急":
				train.type = TrainService.Type.COMMUTER_LTD_EXPRESS
			"直通特急":
				train.type = TrainService.Type.DIRECT_EXPRESS
			_:
				push_error("Unknown train type: " + item["train"]["type"])
				return null

		for stop in item["stops"]:
			var station: Station = timetable.stations.get(stop["station"])
			if station != null:
				continue

			station = Station.new()
			station.name = stop["station"]
			timetable.stations[station.name] = station

		var stops: Array[Stop]
		for stop_data in item["stops"]:
			var stop: Stop = Stop.new()
			stop.arrival = textToSeconds(stop_data["arr"])
			stop.departure = textToSeconds(stop_data["dep"])
			stop.station = timetable.stations[stop_data["station"]]

			stops.append(stop)
		train.stops = stops

# Takes a time string in the format "HH:mm" and returns the represented time in seconds
static func textToSeconds(string: String) -> float:
	if string == null:
		return null

	var split: PackedStringArray = string.split(":")
	assert(len(split) == 2, str(split))

	var hours: float = split[0].to_float()
	var minutes: float = split[1].to_float()

	return ((hours * 60) + minutes) * 60

# Takes a time string in the format "HH:mm" and returns the represented time in seconds
static func secondsToText(time: float) -> String:
	if time == null:
		return null

	var hours: int = int(time / 3600)
	var minutes: int = int(time / 60) - (hours * 60)

	return "%02d:%02d" % [hours, minutes]
