---
title: "Hello World"
publishdate: 2023-11-13
---

{{< projecttheme >}}

# Hello World

{{< imagedetails
    images="/projects/spmp/journey/0.png /projects/spmp/journey/1.png /projects/spmp/journey/2.png"
    title="The first screenshots of SpMp"
    subtitle="Taken 14 Sep 2022"
    flex=true
    row-style="min-width: 40%;"
>}}

The layout is very different now, but most of the actual functionality and content of the core player page was already implemented after one month of development.

You can see that the song queue was originally placed to the side of the player and navigated to using a button row at the bottom of the page. I never made the UI for the button row fully responsive, which is why it looks the same in each screenshot despite them being on different pages.

The system for theming the UI using a colour from the song image was also in place at this point. It doesn't look like it in the first screenshot, but the second and third make a bit more sense. Thankfully, the algorithm for colour selection has improved quite a bit since this.

{{< /imagedetails >}}

{{< imagedetails
    images="/projects/spmp/journey/-1.png"
    title="The *actual* first screenshot of SpMp"
    subtitle="Taken 30 August 2022"
>}}

It looked funny, so I took a screenshot. That's it.

The culprit? Probably [aspectRatio()](https://developer.android.com/reference/kotlin/androidx/compose/ui/Modifier#(androidx.compose.ui.Modifier).aspectRatio(kotlin.Float,kotlin.Boolean)) (if you know, you know).

The song? [https://music.youtube.com/watch?v=olWvy0PiLfA](https://music.youtube.com/watch?v=olWvy0PiLfA)

{{< /imagedetails >}}
