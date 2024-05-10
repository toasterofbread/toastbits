---
title: "SpMp UI designs"
publishdate: 2024-05-04
---

{{< projecttheme >}}

# SpMp UI designs

Throughout SpMp's development, I've mostly just thrown UI layouts together on the spot, implementing ideas as I come up with them. Occasionally, however, I've sat down with some paper and a pencil and planned a screen out (shocking, I know).

Whenever I draw one of these, it always pleasantly surprises me how smoothly I'm able to implement them in software, and how little I have to change.

Not all of these have exact recorded dates, but they're definitely in chronological order of creation.

{{< imagedetails
    images=""
    title="Portrait home feed page"
    subtitle="2023-04-17"
>}}

It was during this first design when I had the (apparently unique) idea to display the current line of the song's lyrics persistently, rather than just in the player view. Pinned items aren't shown in the 'after' image, but they were implemented as designed.

This design has persisted almost in its original state since it was implemented, with the only difference being that the buttons in the floating menu (bottom-right corner) were redistributed. The only change to this screen was that the search button moved to the left of the feed filters at the top of the screen.

Design                   | Before (v0.0.1)                             | After (v0.0.2)
:-----------------------:|:-------------------------------------------:|:-----------------------------------------:
![](images/23_04_17.jpg) | ![](screenshots/player_portrait_before.png) | ![](screenshots/player_portrait_after.png)

{{< /imagedetails >}}

{{< imagedetails
    images=""
    title="Settings page"
    subtitle="2023-04"
>}}

Design                | Before (v0.0.1)                   | After (v0.0.2)
:--------------------:|:---------------------------------:|:-------------------------------------:
![](images/23_04.jpg) | ![](screenshots/settings_before.png) | ![](screenshots/settings_after.png)

{{< /imagedetails >}}

{{< imagedetails
    images=""
    title="Library page"
    subtitle="2023-05"
>}}

Unlike most other designs, which were for replacing existing layouts, this was for a completely new UI. While technically there was a library page in SpMp before I made this, it had almost no functionality and the things that were there were very temporary.

Most of this design never made it into SpMp directly. While you can see in the implementation image that I added most of the left-hand screen from the design, it's only a partial implementation and I clearly didn't spend much time polishing it. If I remember correctly, the library page stayed in this state for a while before I completely replaced it for v0.2.0 (without a drawn design).

Design                  | Implementation
:----------------------:|:---------------------------------:
![](images/23_05-0.jpg) | ![](screenshots/library_after.png)

{{< /imagedetails >}}

{{< imagedetails
    images=""
    title="Playlist page"
    subtitle="2023-05"
>}}

While I'm not certain, I think this was also a case of a design I made for a completely new UI. Most of the design made it into the implementation, although I replaced the row of action chip buttons with some icon buttons above the wide play button.

This has survived to the current day, with some adjustments including moving the icon buttons back to their original position, and convenience buttons for selecting all items as well as jumping to the top or bottom of the list.

Design                  | After (probably v0.0.2)             | Now (pre-v0.4.0)
:----------------------:|:-----------------------------------:|:--------------------------------:
![](images/23_05-1.jpg) | ![](screenshots/playlist_after.png) | ![](screenshots/playlist_now.png)

{{< /imagedetails >}}

{{< imagedetails
    images=""
    title="Landscape player page"
    subtitle="2023-11-07"
>}}

Design                  | Implementation
:----------------------:|:-------------------------------------------:
![](images/23_11_07.jpg) | ![](screenshots/player_landscape_after.png)

{{< /imagedetails >}}

{{< imagedetails
    images=""
    title="Song theming menu"
    subtitle="2023-12-06"
>}}

Design                  | Implementation
:----------------------:|:-------------------------------------------:
![](images/23_12_06-0.jpg) | ![](screenshots/song_theming_after.png)

{{< /imagedetails >}}

{{< imagedetails
    images=""
    title="Landscape artist page"
    subtitle="2023-12-06"
>}}

Design                  | Implementation
:----------------------:|:---------------------------------------------:
![](images/23_12_06-1.jpg) | ![](screenshots/artist_landscape_after.png)

{{< /imagedetails >}}

{{< imagedetails
    images=""
    title="Landscape home feed page"
    subtitle="2023-12-12"
>}}

Design                  | Implementation
:----------------------:|:-------------------------------------------:
![](images/23_12_12-0.jpg) | ![](screenshots/home_landscape_after.png)

{{< /imagedetails >}}

{{< imagedetails
    images=""
    title="Miscellaneous content page"
    subtitle="2023-12-12"
>}}

Design                  | Implementation
:----------------------:|:-------------------------------------------:
![](images/23_12_12-1.jpg) | ![](screenshots/server_status_after.png)

{{< /imagedetails >}}
