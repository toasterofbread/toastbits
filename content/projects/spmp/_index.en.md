---
title: "SpMp"
description: "A YouTube Music client for Android and Desktop I've been working on since August 2022.
I've implemented useful queue manipulation features, as well as language and metadata customisation options."

github_repo: "spmp"
source_code: "https://github.com/toasterofbread/spmp"
icon_url: https://raw.githubusercontent.com/toasterofbread/spmp/main/metadata/en-US/images/icon.png

links: [
    { "icon": "fa-brands fa-discord", "link": "https://discord.gg/B4uY4FkkJ3", "label": "Discord" },
    { "icon": "fa-brands fa-android", "link": "https://f-droid.org/en/packages/com.toasterofbread.spmp/", "label": "F-Droid" },
    { "icon": "fa-brands fa-github", "link": "https://github.com/toasterofbread/spmp", "label": "Repo" },
    { "icon": "fa-solid fa-code", "link": "https://spmp.toastbits.dev", "label": "Documentation" }
]
tags:
- Kotlin
- Compose
- Android

start_year: 2022
start_month: 8
publishdate: 2022-08-01

images: ["/projects/spmp/images/1.png", "/projects/spmp/images/landscape_1.png", "/projects/spmp/images/2.png", "/projects/spmp/images/3.png", "/projects/spmp/images/landscape_2.png", "/projects/spmp/images/4.png", "/projects/spmp/images/5.png", "/projects/spmp/images/6.png", "/projects/spmp/images/landscape_2.png", "/projects/spmp/images/7.png", "/projects/spmp/images/8.png", "/projects/spmp/images/9.png", "/projects/spmp/images/0.png"]
background_image: "/projects/spmp/background.svg"

cascade:
    accent_colour_light: "#d6beeb"
    accent_colour_dark: "#43265c"
---

{{< projecttheme >}}
{{< projectheader >}}

# How it started

Before SpMp I had been using the official YouTube Music client on both desktop and mobile, more or less exclusively. Over time, however, I grew less and less patient because of reasons including (but not limited to) these:

- Complete lack of customisability
- Very little creativity or flair in its visual or functional design
- Missing lyrics for most songs, and (at the time) no synchronisation
- Bloated and not open-source
- Desktop/browser version is particularly buggy and unpolished

{{< rawhtml >}}
<p style="font-size: 0.75em; opacity: 50%;">
An example of that last one: When you try to remove a song from the queue, YouTube Music will sometimes decide to instead remove the <b>current song</b> instead. This happened as I was writing this, so I thought I'd mention it.
</p>
{{< /rawhtml >}}

I tried a few alternatives, including Spotify and [ViMusic](https://github.com/vfsfitvnm/ViMusic), but nothing ticked all of the boxes I was hoping to fill.

While I did briefly consider forking a project like ViMusic, I felt like there was so much that I wanted to add that I would be better off starting with a blank canvas and coming out with a better understanding of what I'd created. And surely it would only take me a few months anyway (this was in August of 2022).

# How it's going

In early-mid 2023, after well over half a year of development, I completely stopped using YouTube Music on Android in favour of SpMp. Hopefully, I'll be able to leave it behind on desktop as well once I complete SpMp's own [desktop version](https://github.com/toasterofbread/spmp/pull/170).

You can read more about SpMp's development in [./journey](journey).

# What does "SpMp" stand for?

SpMp was originally a combination the first two letters of my old username "spectreseven1138" and "music player". Hence:
```
Sp + Mp = SpMp = spectreseven1138 music player
```
Very creative, I know.
