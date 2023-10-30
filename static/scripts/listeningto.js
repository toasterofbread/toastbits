const STATUS_URL = "https://status.toastbits.dev/song/info"

function isColourLight(colour) {
    const r = colour[0]
    const g = colour[1]
    const b = colour[2]

    hsp = Math.sqrt(
        0.299 * (r * r) +
        0.587 * (g * g) +
        0.114 * (b * b)
    )

    return hsp > 127.5
}

function setThemeColour(colour) {
    const element = document.querySelector("#listeningto")
    element.style.backgroundColor = `rgb(${colour[0]}, ${colour[1]}, ${colour[2]})`
    element.style.setProperty("--content-colour", isColourLight(colour) ? "black" : "white")
}

async function applyCurrentStatus() {
    const response = await fetch(STATUS_URL)
    const status = await response.json()   
    
    if (status == null) {
        const listeningto = document.getElementById("listeningto")
        if (listeningto != null) {
            listeningto.remove()
        }

        if (document.getElementById("listeningtonull") != null) {
            return
        }
        
        const element = document.createElement("div")
        const template = document.querySelector("template.listeningtonull")
        element.appendChild(template.content.cloneNode(true))
        element.id = "listeningtonull"
        template.parentNode.insertBefore(element, template.nextSibling);
        return
    }
    
    if (document.getElementById("listeningto") == null) {
        const template = document.querySelector("template.listeningto")
        
        const element = document.createElement("div")
        element.id = "listeningto"
        element.appendChild(template.content.cloneNode(true))

        template.parentNode.insertBefore(element, template.nextSibling)
    }

    const property_values = {
        innerHTML: {
            title: status.title,
            artist: status.channel_name,
            client_name: status.client_name,
            age: Math.trunc(status.age / 6) / 10
        },
        href: {
            url: "https://music.youtube.com/watch?v=" + status.youtube_video_id,
            artist_url: "https://music.youtube.com/channel/" + status.channel_id,
            client_url: status.client_url
        },
        src: {
            thumbnail: "https://corsproxy.io/?" + status.thumbnails[status.thumbnails.length - 1].url.split("?")[0],
            client_icon: status.client_icon
        }
    }
    
    for (const [property, values] of Object.entries(property_values)) {
        for (const [key, value] of Object.entries(values)) {
            const el = document.getElementById(key)
            if (el != null) {
                el[property] = value
            }
        }
    }
    
    const image = document.getElementById("thumbnail")
    const colour_thief = new ColorThief()

    if (image.completed) {
        setThemeColour(colour_thief.getColor(image))
    } 
    else {
        image.addEventListener("load", function() {
            setThemeColour(colour_thief.getColor(image))
        })
    }
}

const delay = (delay_ms) => {
    return new Promise(resolve => setTimeout(resolve, delay_ms));
};

async function pollStatus() {
    while (true) {
        applyCurrentStatus()
        await delay(1000 * 60 * 2)
    }
}

pollStatus()
