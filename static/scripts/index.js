const TITLE_CYCLE_DELAY_MS = 10000
const TITLE_CYCLE_TYPING_DELAY = 300
const TITLE_CYCLE_DELETING_DELAY = 50

const delay = (delay_ms) => {
    return new Promise(resolve => setTimeout(resolve, delay_ms));
};

async function getFortune() {
    const response = await fetch("https://helloacm.com/api/fortune/", {cache: "reload"})
    const fortune = await response.json()

    const code_blocks = document.querySelectorAll("code");

    for (let i = 0; i < code_blocks.length; i++) {
        const block = code_blocks.item(i)
        if (!block.innerHTML.endsWith("$ fortune\n")) {
        continue
        }

        block.innerHTML += fortune
        break
    }
}

async function cycleTitleText() {
    const title_element = document.getElementById("title")
    var title_index = 1

    const titles = JSON.parse(document.currentScript.getAttribute("titles"))

    while (title_element != null) {
        for (; title_index < titles.length; title_index++) {
            await delay(TITLE_CYCLE_DELAY_MS)

            while (title_element.innerHTML.length > 0) {
                title_element.innerHTML = title_element.innerHTML.slice(0, -1)
                await delay(TITLE_CYCLE_DELETING_DELAY)
            }

            await delay(TITLE_CYCLE_TYPING_DELAY)

            const title = titles[title_index]
            for (var i = 0; i < title.length; i++) {
                title_element.innerHTML += title[i]
                await delay(TITLE_CYCLE_TYPING_DELAY * Math.random())
            }
        }
        title_index = 0
    }
}

getFortune()
cycleTitleText()
