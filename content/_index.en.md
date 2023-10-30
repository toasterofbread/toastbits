---
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

I make stuff for fun and put it on the Internet. I've been programming on and off (but mostly on) since teaching myself Python in 2019.

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
      <li><a href="projects?tag=Lua">Lua</a></li>
    </ul>
  </div>

  <div>
    <h4>Frameworks</h4>
    <ul>
      <li><a href="projects?tag=Godot">Godot Engine</a></li>
      <li><a href="projects?tag=Jetpack+Compose">Jetpack Compose</a></li>
      <li><a href="projects?tag=Raylib">Raylib</a></li>
    </ul>
  </div>

  <div>
    <h4>Other technologies</h4>
    <ul>
      <li><a href="projects?tag=GCloud">Google Cloud & Firebase</a></li>
      <li><a href="projects?tag=VR">Virtual reality</a></li>
      <li><a href="projects?tag=Discord">Discord</a></li>
      <li><a href="projects?tag=Android">Android</a></li>
    </ul>
  </div>

  <div>
    <h4>Spoken languages</h4>
    <ul>
      <li>English (fluent)</li>
      <li><a href="projects?tag=Japanese">Japanese</a> (fluent)</li>
    </ul>
  </div>
</div>

<br>
<br>

<code>$ ls <a href="/en/projects">/projects</a></code>

{{< /rawhtml >}}

{{< bookcase section="/projects" row=true preview=true >}}

<!-- {{< rawhtml >}}
<code>$ curl https://status.toastbits.dev/song > <a href="/en/about">/about</a></code>
{{< /rawhtml >}} -->

```
$ pwd
/home/toaster

$ neofetch
                   -`                    toaster@toastbits.dev
                  .o+`                   ------------------
                 `ooo/                   OS: Arch Linux x86_64
                `+oooo:                  Kernel: 6.1.55-1-lts
               `+oooooo:                 Shell: fish 3.6.1
               -+oooooo+:                Displays: 1920x1080 (x2)
             `/:-:++oooo+:               DE: Hyprland
            `/++++/+++++++:              Theme: Catppuccin Mocha (Lavender)
           `/++++++++++++++:             Terminal: kitty
          `/+++ooooooooooooo/`           CPU: Intel i7-3770 (8) @ 3.900GHz
         ./ooosssso++osssssso+`          GPU: AMD ATI Radeon RX 6650 XT
        .oossssso-````/ossssss+`         Memory: 15892MiB
       -osssssso.      :ssssssso.        
      :osssssss/        osssso+++.       IDE: Visual Studio Code
     /ossssssss/        +ssssooo/-       Engine: Godot
   `/ossssso+/:-        -:/+osssso+-     Keyboard: 75% (brown)
  `+sso+:-`                 `.-/+oso:    Music: J-pop, rock
 `++:.                           `-/+/   Github: toasterofbread
 .`                                 `/   

$ fortune
```

{{< rawhtml >}}
<script src="/scripts/index.js"></script>
{{< /rawhtml >}}
