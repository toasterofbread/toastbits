---
title: "Displaying trains on a map using real-world timetable data"
publishdate: 2024-03-01T00:00:01
---

{{< rawhtml >}}
<style>
    code {
        max-height: 300px
    }
</style>
{{< /rawhtml >}}


# Displaying trains on a map using real-world timetable data

{{< rawhtml >}}<br><br>{{< /rawhtml >}}

## Calculating on-map train positions

The core parts of displaying trains based on timetable data are the **calculateTrainPosition** and **calculateMapTrainPositions** functions defined below.

#### **calculateTrainPosition**

This takes a **TrainService** (containing timetable data) and timestamp, and outputs a **TrainPosition** struct containing the train's previous stop, next stop, and the fraction of the distance between them it has travelled.

It works by checking each pair of stops in the train's schedule until it either finds a pair that the current time falls between, or finds a station that the train is currently stopped at.

#### **calculateMapTrainPositions**

**calculateMapTrainPositions** takes a timestamp, as well as a **Map** data structure, a **Timetable**, and a dictionary allowing easy access to the corresponding **MapNode** (from **Map**) of each **Station** (from **Timetable**). It then returns a dictionary containing the **Vector2** position of each active train in the timetable, using **calculateTrainPosition** in the process.

This involves some simple maths including calculating the total length of track between pairs of station nodes, and calculating the physical position of a train on a section of track based on its progress fraction.

{{< emgithub target="https://github.com/toasterofbread/LiveRail/blob/1e21bd2ad580041a0551816a5c5ee2e8c3ba5817/src/script/timetable/TrainPosition.gd" lang=gdscript />}}

{{< rawhtml >}}<br>{{< /rawhtml >}}

## Displaying trains using calculated positions

Once I'd written the logic and structures for calculating the position of each train, I added a basic implementation for displaying each active position on the in-game map of stations and track.

Doing this was quite simple, all I needed to do was recalculate the position of each train on every frame and render a marker at each frame. I accomplished this my moving the expensive calculations into a separate thread which continually updates a dictionary containing train positions, which is then independently rendered each frame with a simple **draw_circle** call.

I also added a **time** variable which is updated each frame and used for position calculations, as well as a simple display of the current simulation time in the corner of the screen.

{{< emgithub target="https://github.com/toasterofbread/LiveRail/blob/1e21bd2ad580041a0551816a5c5ee2e8c3ba5817/src/scene/map/MapDisplay.gd" lang=gdscript />}}

{{< imagedetails
    images="../images/proto_02.png"
    title="The result"
    row-style="min-width: 50%"
    flex=true
>}}

{{< rawhtml >}}<br>{{< /rawhtml >}}

In this image, five separate trains can be seen. These animate smoothly along the track lines based on the simulation time, visible in the bottom-left corner.

There are still a few bugs to iron out though. Most notably (and visible in the image), some trains don't travel along the correct track. This is an issue of this specific section of rail where three lines (for six total tracks) run parallel between three stations. I'm fairly sure it's caused by an oversight in the code that finds the map node of each timetable station, in which stations can match nodes with the same name even if they aren't on the same railway line.

{{< /imagedetails >}}
