---
title: "mediasession-kt"
description: "A Kotlin Multiplatform library for emitting a system media session."

github_repo: "ytm-kt"
source_code: "https://github.com/toasterofbread/mediasession-kt"

links: [
    { "icon": "bx bxl-github", "link": "https://github.com/toasterofbread/mediasession-kt", "label": "Repository" }
]
tags:
- Kotlin
- Library

start_year: 2024
start_month: 4
end_year: 2024
end_month: 4
publishdate: 2024-04-10

hide_in_preview: true
images: []
background_image: "/background-generic.svg"
accent_colour_light: "#f27483"
accent_colour_dark: "#470512"
---

{{< projecttheme >}}
{{< projectheader >}}

While looking for a way to add OS media session integration to SpMp, I did find a working Java library, but I wanted a solution that would also work with spmp-server (which uses Kotlin/Native), so I implemented the DBus MPRIS protocol myself.
