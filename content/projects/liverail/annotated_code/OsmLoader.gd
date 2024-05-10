extends RefCounted
class_name OsmLoader

# Map object to be populated by the functions below
var map: Map = Map.new()

# Load the OSM file at file_path into map
func loadOsmFile(file_path: String):
	# Create XML parser and open file
	var parser: XMLParser = XMLParser.new()
	parser.open(file_path)

	# Iterate through each line of the file
	while parser.read() != ERR_FILE_EOF:

		# Skip any lines that aren't node elmeents
		if parser.get_node_type() != XMLParser.NODE_ELEMENT:
			continue

		# Check the node's name, and parse it using the corresponding function
		match parser.get_node_name():
			"node":
				parseNode(parser)
			"way":
				parseWay(parser)
			"relation":
				parseRelation(parser)

	# During the previous stage, line segments and stations only hold ID-based references to other nodes
	# The loops below populate each segment and station with references to the actual objects that they require

	for segment in map.rail_segments.values():
		for node in segment.node_refs:
			segment.nodes.append(map.nodes[node])

	for line in map.rail_lines:
		for segment in line.segment_refs:
			if segment in map.rail_segments:
				line.segments.append(map.rail_segments[segment])

		for station in line.station_refs:
			if station in map.nodes:
				line.stations.append(map.nodes[station])

# Takes a parser positioned on a node, and adds the node to the map
func parseNode(parser: XMLParser):
	var node: Map.MapNode = Map.MapNode.parse(parser)
	map.nodes[node.id] = node

# Takes a parser positioned on a way, and adds its segments to the map
func parseWay(parser: XMLParser):
	var names: Dictionary = {}
	var railway: String = null
	var rail_nodes: Array[int] = []
	var id: int = int(parser.get_named_attribute_value("id"))

	# Iterate over XML lines
	while parser.read() != ERR_FILE_EOF:
		match parser.get_node_type():
			# Stop iterating when the node ends
			XMLParser.NODE_ELEMENT_END:
				break
			# Run while block if on a node element
			XMLParser.NODE_ELEMENT:
				pass
			# Skip all other node types
			_:
				continue

		var subnode_name: String = parser.get_node_name()

		# If this is an OSM node, add it to the list of rail nodes
		if subnode_name == "nd":
			rail_nodes.append(int(parser.get_named_attribute_value("ref")))
			continue

		# Continue if this isn't a tag node
		if subnode_name != "tag" || parser.get_node_type() != XMLParser.NODE_ELEMENT:
			continue

		# Get the node's key and value attributes
		var key: String = parser.get_named_attribute_value_safe("k")
		var value: String = parser.get_named_attribute_value_safe("v")

		# If the key is a name (such as 'name:en'), add it to the names dictionary
		if key.begins_with("name:"):
			# Remove 'name:' prefix from key
			names[key.substr(5)] = value
			continue

		match key:
			# Mark this node as a railway
			"railway":
				railway = value

	# If this node is a railway, add its data to the map
	if railway != null:
		map.rail_segments[id] = RailSegment.new(id, names, rail_nodes)

# Takes a parser positioned on a relation, and adds its rail lines to the map
func parseRelation(parser: XMLParser):
	var rail_line: RailLine = RailLine.new()
	var is_railway: bool = false

	# Iterate over XML lines
	while parser.read() != ERR_FILE_EOF:
		match parser.get_node_type():
			# Stop iterating when the node ends
			XMLParser.NODE_ELEMENT_END:
				break
			# Run while block if on a node element
			XMLParser.NODE_ELEMENT:
				pass
			# Skip all other node types
			_:
				continue

		var subnode_name: String = parser.get_node_name()

		# If this is a member node, add it to the rail line
		if subnode_name == "member":
			var member_type: String = parser.get_named_attribute_value("type")
			var member_ref: int = int(parser.get_named_attribute_value("ref"))

			match member_type:
				"node":
					if parser.get_named_attribute_value("role") == "stop":
						rail_line.station_refs.append(member_ref)
				"way":
					rail_line.segment_refs.append(member_ref)

		# If this is a tag, extract and store its information
		elif subnode_name == "tag":

			# Get the node's key and value attributes
			var key: String = parser.get_named_attribute_value_safe("k")
			var value: String = parser.get_named_attribute_value_safe("v")

			# If the key is a name (such as 'name:en'), add it to the names dictionary
			if key.begins_with("name:"):
				# Remove 'name:' prefix from key
				rail_line.names[key.substr(5)] = value
				continue

			# Store railway operator name without prefix
			elif key.begins_with("operator:"):
				rail_line.operator_names[key.substr(9)] = value

			# Store line Wikipedia URL
			elif key == "wikipedia":
				rail_line.wikipedia_ref = value

			# Store line colour
			elif key == "colour":
				rail_line.colour = Color.from_string(value, Color.RED)

			elif key == "route":
				if value == "train":
					# Mark this node as a railway
					is_railway = true

	# Return if the railway tag wasn't found
	if not is_railway:
		return

	# Add this line to the map
	map.rail_lines.append(rail_line)


extends Node

func _ready():
    var loader = OsmLoader.new()
    loader.loadOsmFile("res://map.osm")

    var rail_segment_lines: Array[RailSegmentLine] = []

    for rail_line in loader.rail_lines:
        for rail_segment in rail_line.segments:
            if rail_segment.names.is_empty():
                continue

            var line = RailSegmentLine.new()
            line.applyRailSegment(rail_segment, rail_line)

            rail_segment_lines.append(line)
            add_child(line)

        for station in rail_line.stations:
            var sprite = Sprite2D.new()
            sprite.texture = preload("res://icon.svg")
            sprite.global_position = station.pos * 0.01
            sprite.scale = Vector2.ONE * 0.05
            add_child(sprite)


