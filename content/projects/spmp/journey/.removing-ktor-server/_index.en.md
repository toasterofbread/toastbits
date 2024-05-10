---
title: "The ridiculous amount of effort it took to remove ktor-server from SpMs"
publishdate: 2024-02-03
---

{{< projecttheme >}}

# The ridiculous amount of effort it took to remove ktor-server from SpMs

## Some background

The desktop server component of SpMp (shortened to [SpMs](https://github.com/toasterofbread/spmp-server)) is responsible for playing YouTube songs on-request from SpMp. SpMs uses mpv as a backend, and mpv does a lot of the work for me including queue management and actually streaming and playing the songs. All SpMs has to do is give it the ID of each song to add to the queue, and mpv will automatically use yt-dlp to get the stream URL for that song and begin playback.

This causes three issues for SpMp:
1. The user is required to install yt-dlp on their system
2. yt-dlp is kind of slow anyway
3. mpv's song loading process can't be overridden, so premium content can't be played even if a premium user logs in to SpMp

My initial solution to this (once I got around to fixing it) involved a local HTTP server running within SpMs. If the local address of the server was `https://127.0.0.1/`

## Forking mpv

## The hard part


<!-- So, ***IN THEORY***, the ONLY difference between the shared binary that works fine and the static binary that fails silently is those calls to that stupid fucking fcntl function that I had to comment out because they were undefined during linking to SpMs.

So, ***IN THEORY***, I should be able to just implement those using ioctl (which does seem to be defined) and it should work fine.

Then, ***IN THEORY***, I should be able to compile libmpv's dependencies so that I can statically link those to SpMs as well so that the final binary is actually usable on systems that aren't Ubuntu Focal.

Ughhhhhhh -->
