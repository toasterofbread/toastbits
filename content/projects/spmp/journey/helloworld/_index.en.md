---
title: "Hello World"
publishdate: 2023-11-13
---

{{< projecttheme >}}

# Hello World

{{< rawhtml >}}

<style>
    
.row {
    display: flex;
    gap: 20px;
    margin-top: 35px;

    .content {
        margin-right: auto;

        .date {
            font-size: 0.75em;
            opacity: 75%;
        }
    }

    img {
        max-height: 500px;
        margin: 0;
    }

    .images {
        gap: 10px;
        display: flex;
        overflow-x: scroll;
        min-width: 50%;
    }
}

</style>

<div class="row">
    <div class="images">
        <img src="/projects/spmp/journey/0.png">
        <img src="/projects/spmp/journey/1.png">
        <img src="/projects/spmp/journey/2.png">
    </div>

    <div class="content">
        <h4>The first screenshots of SpMp</h4>
        <span class="date">Taken 14 Sep 2022</span>
        
        <p>
        The layout is very different now, but most of the actual functionality and content of the core player page was already implemented after one month of development.
        </p>
        <p>
        You can see that the song queue was originally placed to the side of the player and navigated to using a button row at the bottom of the page. The I never made the UI for the button row fully responsive, which is why it looks the same in each screenshot despite them being on different pages.
        </p>
        <p>
        The system for theming the UI using a colour from the song image was also in place at this point. It doesn't look like it in the first screenshot, but the second and third make a bit more sense. Thankfully, the algorithm for colour selection has improved quite a bit since this.
        </p>
    </div>
</div>

<div class="row">
    <img src="/projects/spmp/journey/-1.png" class="image">

    <div class="content">
        <h4>The <i>actual</i> first screenshot of SpMp</h4>
        <span class="date">Taken 30 August 2022</span>
        
        <p>
        It looked funny, so I took a screenshot. That's it.
        </p>
        <p>
        The culprit? Probably <a href="https://developer.android.com/reference/kotlin/androidx/compose/ui/Modifier#(androidx.compose.ui.Modifier).aspectRatio(kotlin.Float,kotlin.Boolean)">aspectRatio()</a> (if you know, you know).
        </p>
        <p>
        The song? <a href="https://music.youtube.com/watch?v=olWvy0PiLfA">https://music.youtube.com/watch?v=olWvy0PiLfA</a>.
        </p>
    </div>
</div>

{{< /rawhtml >}}
