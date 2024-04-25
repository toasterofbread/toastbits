---
title: "Godot Android Webview"
description: "Hacking together a way of displaying webview content in Godot on Android"

github_repo: ""
source_code: ""

links: [
    { "icon": "fa-brands fa-github", "link": "", "label": "Repository" }
]
tags:
- Godot
- Android

start_year: 2024
start_month: 4
end_year: 0
end_month: 0
publishdate: 2024-04-24

images: []
---

{{< projecttheme >}}
{{< projectheader >}}

This started as a thought experiment of how I could use define UI in Godot using Compose (or Compose-like) syntax, using the [Godot Kotlin/JVM](https://github.com/utopia-rise/godot-kotlin-jvm) project, and evolved into a project to display [SinkSabre](TODO) directly within [BeatSource](TODO).

My ideas progressed like this:

1. Implement a Godot UI framework in Kotlin, making it as close to the Compose-API as possible

I thought it would be fairly easy to get a basic prototype written and working, with basic layout structures and modifiers, I couldn't think of a way to have logic placed directly within Composable functions work (as in, not in a modifier lambda or a side effect).
So while this might have worked with some very basic layouts, many would still need reworking. In other words, it wouldn't be worth the work to, effectively, design and implement a UI framework from scratch.

2. Using Compose Multiplatform directly

I knew that Godot Kotlin/JVM would technically allow me to include Compose Multiplatform in a Godot project, but that I would have to either find a way of getting AWT/Swing to work nicely in Android, or implement a new Compose target specifically for Godot. I've a decent amount of digging into Compose's source code, but not enough to know how to do that (or even know if it would be possible).
