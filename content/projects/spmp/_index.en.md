---
title: "SpMp"
description: "A YouTube Music client I've been making since August 2022.
I've implemented useful queue manipulation features, as well as language and metadata customisation options.
Seeing poor song title translations on a daily basis in the official app and not being able to change them was a great motivator."
source_code: "https://github.com/toasterofbread/spmp"

links: [
    { "icon": "fa-brands fa-github", "link": "https://github.com/toasterofbread/spmp" },
    { "icon": "fa-brands fa-android", "link": "https://f-droid.org/en/packages/com.toasterofbread.spmp/" },
    { "icon": "fa-brands fa-discord", "link": "https://discord.gg/B4uY4FkkJ3" }
]
tags:
- Kotlin
- Jetpack Compose
- Android

start_year: 2022
start_month: 8
publishdate: 2022-08-01

bookcase_images: ["/projects/spmp/0.png", "/projects/spmp/1.png", "/projects/spmp/2.png"]
bookcase_background_src: "/projects/spmp/background.svg"

bookcase_accent_colour_light: "#d6beeb"
bookcase_accent_colour_dark: "#43265c"
---

{{< rawhtml >}}

<style>
#heading {
    display: flex;
    gap: 2rem;
    background-color: #624b99;
    padding: 20px;
    border-radius: 10px;
    
    .content {
        margin-right: 40%;
        gap: 2rem;

        h1 {
            * {
                color: #dbb5fe;
            }
            font-size: 2em;
        }
        p {
            font-size: 1.1em;
        }
    }
}
</style>

<div id="heading">
    <img src="https://raw.githubusercontent.com/toasterofbread/spmp/main/metadata/en-US/images/icon.png" style="float: left; width: 8rem; height: 8rem; clip-path: circle(50%); margin: auto;">
    <div class="content">
        <h1><a href="https://github.com/toasterofbread/spmp">SpMp</a></h1>
        <p>A YouTube Music client with a focus on language and metadata customisation. Built with Kotlin and Jetpack Compose for Android.</p>
    </div>
</div>

{{< /rawhtml >}}

I started this project after I got tired of dealing with YouTube's official music app's lack of language features and customisation. I tried several alternatives, but all had at least a few issues that bugged me.

So instead of spending a few weeks learning the codebase of an existing project and contributing to it, I decided to spend almost a year (as of writing) creating my own solution.
