---
title: "Parsing and displaying railway lines from OSM"
publishdate: 2024-02-13
---

{{< rawhtml >}}
<style>
    code {
        max-height: 300px
    }
</style>
{{< /rawhtml >}}


# Parsing and displaying railway lines from OSM

{{< rawhtml >}}<br><br>{{< /rawhtml >}}

## Map format

I started by downloading a section of northern Osaka city from [OpenStreetMap](https://www.openstreetmap.org/), which comes in an XML format aptly named osm. An osm file is an unordered list of objects or points in the map called nodes (an example of which is shown below).

```
 <node id="4427192486" visible="true" version="5" changeset="76073233" timestamp="2019-10-23T00:24:49Z" user="okadatsuneo" uid="10163840" lat="34.7205345" lon="135.4822731">
  <tag k="name" v="十三"/>
  <tag k="name:en" v="Jūsō"/>
  <tag k="network" v="阪急電鉄神戸線;阪急電鉄宝塚線;阪急電鉄京都線"/>
  <tag k="operator" v="阪急電鉄"/>
  <tag k="public_transport" v="station"/>
  <tag k="railway" v="station"/>
  <tag k="toilets:wheelchair" v="yes"/>
  <tag k="train" v="yes"/>
  <tag k="wheelchair" v="yes"/>
  <tag k="wikidata" v="Q866163"/>
  <tag k="wikipedia" v="ja:十三駅"/>
 </node>
```

In addition to nodes, an osm file also contains structures called ways and relations. A way is a list of nodes used to describe a short route, such as a short road or section of track. A relation is usually a larger group of ways and nodes, such as a railway line. Railway relations usually contain multiple nodes (stations) and ways (short track sections). Each of these three data types are uniquely identifiable and store information about themselves such as names and location.

{{< rawhtml >}}<br><br>{{< /rawhtml >}}
## Parsing map data

Once I understood how the map format was structured, I wrote a class for parsing the raw map data into objects that could be used in the simulation.

{{< emgithub target="https://github.com/toasterofbread/LiveRail/blob/7352f6af56c3c13dba413f6e59908c0536248f83/src/script/OsmLoader.gd" lang=gdscript />}}

{{< imagedetails
    images="../images/proto_01.png ../images/map_01.png"
    title="Rendering rail lines with OsmLoader in the section of map I downloaded"
    row-style="max-width: 60%"
    flex=true
>}}

```
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
```

{{< /imagedetails >}}
