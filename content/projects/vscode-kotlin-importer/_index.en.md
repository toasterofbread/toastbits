---
title: "VSCode Kotlin Importer"
description: "A simple VSCode extension that quickly adds import lines for Kotlin keywords."

github_repo: "vscode-kotlin-importer"
source_code: "https://github.com/toasterofbread/vscode-kotlin-importer/"

links: [
    { "icon": "fa-brands fa-github", "link": "https://github.com/toasterofbread/vscode-kotlin-importer/", "label": "Repository" }
]
tags:
- TypeScript
- VSCode

start_year: 2024
start_month: 2
end_year: 2024
end_month: 2
publishdate: 2024-02-22

hide_in_preview: true
images: []
background_image: "/background-generic.svg"
accent_colour_light: "#569cc4"
accent_colour_dark: "#569cc4"
---

{{< projecttheme >}}
{{< projectheader >}}

An simple extension I wrote in an hour or two that quickly adds import lines for Kotlin keywords by keeping an index of existing imports in the current workspace.

Imports can be added through the context menu action while a keyword is selected, or by triggering the import command and inputting the desired keyword.

If multiple imports are available, a list of options will be shown to select from. If only a single import is found, it will be added automatically.

Imports are inserted below the existing import line that has the closest match to the new import, or otherwise to the bottom of the imports list.
