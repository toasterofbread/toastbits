const user = document.currentScript.dataset.user
const repo = document.currentScript.dataset.repo

// if (user == null || repo == null) {
// }

async function getValues() {
    const response = await fetch(`https://api.github.com/repos/${user}/${repo}`)
    const status = await response.json()   

    const templates = document.getElementsByClassName("repo-value-template")
    for (let i = 0; i < templates.length; i++) {
        const template = templates.item(i)
        const element = template.content.cloneNode(true)
        
        let value = status
        for (const key of template.dataset.key.split(",")) {
            value = value[key]
        }
        element.querySelector(".value").innerHTML = value
        
        const url = template.dataset.url
        if (url != null) {
            element.querySelector("a").href = url
        }

        template.parentNode.appendChild(element);
    }

    console.log(status)
}

getValues()
