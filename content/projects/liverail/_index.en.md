---
title: "LiveRail"
description: "A-Level computer science project. Top-down simulation of a railway using real-world timetable and map data."

github_repo: "LiveRail"
source_code: "https://github.com/toasterofbread/LiveRail/"
demo_url: "https://toasterofbread.github.io/LiveRail/"

links: [
    { "icon": "fa-brands fa-github", "link": "https://github.com/toasterofbread/LiveRail/", "label": "Repository" },
    { "icon": "fa-solid fa-play", "link": "https://toasterofbread.github.io/LiveRail/", "label": "Demo" }
]
tags:
- Godot

start_year: 2023
start_month: 11
end_year: 2024
end_month: 4
publishdate: 2024-02-13

images: ["/projects/liverail/0.png", "/projects/liverail/1.png"]
background_image: "/projects/liverail/background.svg"
accent_colour_light: "#77b64d"
accent_colour_dark: "#42662a"
---

{{< projecttheme >}}
{{< projectheader >}}

The final report for this project can be read on the GitHub repository.

A (partial) development log can be read [here](log).

{{< rawhtml >}}

<h1>
    <div style="display: flex; gap: 10px;">
        Demo

        <h5 style="display: flex; align-items: center;">
        [<a id="showIframeButton" href="#">Show</a>]
        [<a id="hideIframeButton" href="#">Hide</a>]
        </h5>
    </div>
</h1>

<embed id="demoEmbed" src="" style="width: 100%; aspect-ratio: 16/9; display: none;"></embed>

<script>
    document.getElementById("showIframeButton").addEventListener("click", function() {
        const embed = document.getElementById("demoEmbed")
        embed.src = 'https://toasterofbread.github.io/LiveRail';
        embed.style.display = "block";
    });

    document.getElementById("hideIframeButton").addEventListener("click", function() {
        const embed = document.getElementById("demoEmbed")
        embed.style.display = "none";
    });
</script>

{{< /rawhtml >}}
