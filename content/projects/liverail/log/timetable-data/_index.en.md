---
title: "Timetable data scraping and storage"
publishdate: 2024-03-01T00:00:00
---

{{< rawhtml >}}
<style>
    code {
        max-height: 500px
    }
</style>
{{< /rawhtml >}}


# Timetable data scraping and storage

{{< rawhtml >}}<br><br>{{< /rawhtml >}}

## Timetable format

Timetable data below was acquired from https://ekitan.com using a simple [python script](https://github.com/toasterofbread/LiveRail/blob/1e21bd2ad580041a0551816a5c5ee2e8c3ba5817/src/tool/gettimetable.py) to scrape all train times for a specific line, storing it in JSON format. Even without considering that it takes several mintutes to scrape each line, the script isn't intended to be used in the project itself.

Below is a sample of the data for the Hankyu Takarazuka line. The top-level structure is an array that holds every train that runs on that line on a weekday, where each item holds information about the train's service type and each of its stops.

```
[
    {
        "train": {
            "type": "普通",
            "destination": "宝塚"
        },
        "stops": [
            {
                "station": "大阪梅田(阪急)",
                "dep": "05:00",
                "arr": null
            },
            {
                "station": "中津(阪急)",
                "dep": "05:02",
                "arr": "05:01"
            },
            {
                "station": "十三",
                "dep": "05:04",
                "arr": "05:04"
            },
            ...
            {
                "station": "宝塚",
                "dep": null,
                "arr": "05:39"
            }
        ]
    }
]
```

{{< rawhtml >}}<br><br>{{< /rawhtml >}}

## Loading timetables into Godot

After I'd stored some timetable data to disk for testing, I began defining the in-engine data structures for holding the timetable values:

- **Timetable**: Top-level class for storing stations and trains
- **Station**: A single station with name information and a schedule (the latter is currently unused)
- **Stop**: Comprised of an arrival and departure time, as well as the station
- **TrainService**: A single train with a linear schedule of stops as well as a type and class
- **TrainClass**: Physical characteristics of a train such as maximum speed and acceleration to be used when displaying a train

Most of these are based closely on the 'Variables and data structures' specification I wrote in my design document, with the main changes being the addition of **TrainStop** (due to my timetable data containing arrival times in addition to departure times) and the removal of **TrainServiceInfo** (the information in which can be inferred from the train's schedule).

The TT namespace containing each data structure also holds the function **loadTimetableFile** which takes a file and a reference to a **Timetable** structure. **loadTimetableFile** parses the file's content and stores it in the passed **Timetable**.

{{< emgithub target="https://github.com/toasterofbread/LiveRail/blob/1e21bd2ad580041a0551816a5c5ee2e8c3ba5817/src/script/timetable/Timetable.gd" lang=gdscript />}}
