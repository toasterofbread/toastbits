---
cascade:
  hl: "en"
  github_user: "toasterofbread"
---

{{< listeningto >}}

`$ whoami`

{{< rawhtml >}}

<style>
  #heading {
    margin-top: -10px;
    display: flex;

    * {
      font-size: 3em;
      font-family: monospace !important;
    }

    p {
      margin-bottom: -5px;
      opacity: 75%;
    }
  }

  #cursor {
    animation: cursorAnimation 3s infinite;
    visibility: hidden;
  }

  @keyframes cursorAnimation {
    50% {
      visibility: visible;
    }
    51% {
      visibility: hidden;
    }
  }
</style>

<div id="heading">
  <div id="title">Talo Halton</div>
  <div id="cursor">_</div>
</div>

{{< /rawhtml >}}

I'm a 19 year-old British-Japanese guy who likes writing code to solve problems. Since teaching myself Python in 2019, I've been improving my skills and learning new ones.

I enjoy a making variety of different types of software, ranging from scripts for my Linux desktop to games and fullstack multiplatform applications.

{{< rawhtml >}}
<style>
  #row {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    row-gap: 20px;

    div {
      padding-right: 100px;
    }
  }
</style>

<br>
<br>

<code>$ ls /skills</code>

<br>

<div id="row">
  <div>
    <h4>Languages</h4>
    <ul>
      <li><a href="projects?tag=Kotlin">Kotlin</a></li>
      <li><a href="projects?tag=Python">Python</a></li>
      <li><a href="projects?tag=Godot">GDScript</a></li>
      <li><a href="projects?tag=C%2B%2B">C++</a></li>
    </ul>
  </div>

  <div>
    <h4>Frameworks / platforms</h4>
    <ul>
      <li><a href="projects?tag=Compose">Jetpack Compose (multiplatform)</a></li>
      <li><a href="projects?tag=Android">Android</a></li>
      <li><a href="projects?tag=Godot">Godot Engine</a></li>
      <li><a href="projects?tag=Raylib">Raylib</a></li>
    </ul>
  </div>

  <div>
    <h4>Other things I'm interested in</h4>
    <ul>
      <li><a href="projects?tag=VR">Virtual reality</a></li>
      <li><a href="projects?tag=Discord">Discord</a></li>
    </ul>
  </div>

  <div>
    <h4>Spoken languages</h4>
    <ul>
      <li>English (native)</li>
      <li>Japanese (fluent)</li>
    </ul>
  </div>
</div>

<br>
<br>

<code>$ ls <a href="/en/projects">/projects</a> | head -5</code>

{{< /rawhtml >}}

{{< bookcase section="/projects" row=true preview=true limit=5 >}}

<!-- {{< rawhtml >}}
<code>$ curl https://status.toastbits.dev/song > <a href="/en/about">/about</a></code>
{{< /rawhtml >}} -->

```
$ pwd
/home/toaster

$ neofetch
          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖            toaster@toastbits.dev
          ▜███▙       ▜███▙  ▟███▛            ------------------
           ▜███▙       ▜███▙▟███▛             OS: NixOS x86_64
            ▜███▙       ▜██████▛              Kernel: 6.6.32
     ▟█████████████████▙ ▜████▛     ▟▙        Shell: fish
    ▟███████████████████▙ ▜███▙    ▟██▙       Displays: 1920x1080 (x2)
           ▄▄▄▄▖           ▜███▙  ▟███▛       DE: Hyprland
          ▟███▛             ▜██▛ ▟███▛        Theme: Catppuccin Mocha (Lavender)
         ▟███▛               ▜▛ ▟███▛         Terminal: kitty
▟███████████▛                  ▟██████████▙   CPU: Intel i7-3770 (8) @ 3.900GHz
▜██████████▛                  ▟███████████▛   GPU: AMD ATI Radeon RX 6650 XT
      ▟███▛ ▟▙               ▟███▛            Memory: 15892MiB
     ▟███▛ ▟██▙             ▟███▛
    ▟███▛  ▜███▙           ▝▀▀▀▀              IDE: Visual Studio Code
    ▜██▛    ▜███▙ ▜██████████████████▛        Engine: Godot
     ▜▛     ▟████▙ ▜████████████████▛         Keyboard: 75% (brown)
           ▟██████▙       ▜███▙               Music: J-pop, rock
          ▟███▛▜███▙       ▜███▙              Github: toasterofbread
         ▟███▛  ▜███▙       ▜███▙
         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘

$ fortune
```

{{< rawhtml >}}
<script src="/scripts/index.js"></script>
{{< /rawhtml >}}
