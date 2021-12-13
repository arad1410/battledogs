const notifyPanel = document.getElementById("notifyPanel");
const notifyTypes = {
    "success": "successNotify",
    "error": "errorNotify",
    "inform": "informNotify",
}

const AddNotify = (notifyText, notifyType, notifyDuration) => {
    const newNotify = document.createElement("div");
    newNotify.innerText = notifyText;
    newNotify.classList.add("notification");
    newNotify.classList.add(notifyTypes[notifyType]);
    notifyPanel.appendChild(newNotify);
    newNotify.style.transition = "transform 0.5s";

    setTimeout(() => {
        newNotify.style.transform = "translateX(0%)";
        setTimeout(() => {
            newNotify.style.transform = "translateX(150%)";
            setTimeout(() => {
                newNotify.remove();
            }, 500);
        }, notifyDuration);
    }, 100);
};

const progressBarTimer = []



const progressPanel = document.getElementById("progressPanel")
const StartProgress = (progressText, progressDuration) => {
    progressPanel.style.opacity = "1.0";
    progressPanel.children[1].children[0].style.transition = "width " + progressDuration / 1000 + "s linear";
    progressPanel.children[0].innerText = progressText;

    progressBarTimer[0] = setTimeout(() => {
        progressPanel.children[1].children[0].style.width = "100%";
        progressBarTimer[1] = setTimeout(() => {
            progressPanel.style.opacity = "0.0";
            progressBarTimer[2] = setTimeout(() => {
                progressPanel.children[1].children[0].style.transition = "width 0s linear";
                progressPanel.children[1].children[0].style.width = "0%";
                fetch("https://dl-core/finishedProgressBar");
            }, 500)
        }, progressDuration + 250)
    }, 500)
}

window.addEventListener("message", (event) => {
    if (event.data.notifyText) {
        AddNotify(event.data.notifyText, event.data.notifyType, event.data.notifyDuration)
    } else if (event.data.progressText) {
        StartProgress(event.data.progressText, event.data.progressDuration)
    } else if (event.data.stopProgress)
    {
        progressPanel.style.opacity = "0.0"
        clearTimeout(progressBarTimer[0])
        clearTimeout(progressBarTimer[1])
        clearTimeout(progressBarTimer[2])
    }
})
