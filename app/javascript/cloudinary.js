const cloudinary = () => {
    const inputs = document.querySelectorAll(".form-img");
    const mediaPreview = document.getElementById("media-preview");

    const uploadMedia = (input) => {
        const file = input.files[0];
        const formData = new FormData();
        formData.append('file', file, encodeURIComponent(file.name));
        // console.log(formData.get("file"))

        const reader = new FileReader();
        let isImage = true;
        reader.readAsDataURL(file);
        reader.onload = function () {
            if (reader.result.startsWith("data:video")) {
                isImage = false;
            }
        }

        fetch(`/upload`, {
            method: "POST",
            headers: {
                "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                "Accept": "application/json"
            },
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                const fileUrl = data.file_url;
                if (isImage) {
                    const imageElement = document.createElement("img");
                    imageElement.src = fileUrl;
                    mediaPreview.appendChild(imageElement);
                } else {
                    const videoElement = document.createElement("video");
                    videoElement.src = fileUrl;
                    videoElement.controls = true;
                    mediaPreview.appendChild(videoElement);
                }
            })
            .catch(error => {
                console.error("Error:", error);
            });
    }
    const openSelector = (event) => {
        let img = event.currentTarget
        let targetId = img.id
        let input = document.getElementById(`message_${targetId}`)
        input.click();
        input.addEventListener("change", (event) => {
            uploadMedia(input)
        });
    }

    inputs.forEach((input) => {
        input.addEventListener("click", openSelector)
    })
}

export  { cloudinary }