const addMail = () => {
  const addMailsButton = document.querySelector(".add-mails-btn");
  const addMailsContainer = document.querySelector(".add-mails");
  const mailTag = `<input type='text' name='emails[]' class='add-mails-input'>`;

  if(addMailsButton) {
    addMailsButton.addEventListener("click", () => {
      addMailsContainer.insertAdjacentHTML("afterbegin", mailTag);
    });
  }
}

function openSelector(event) {
  let img = event.currentTarget
  let targetId = img.id
  let input = document.getElementById(`message_${targetId}`)
  if (targetId !== "letter") {
    input.click();
  } else {
    input.classList.remove("d-none")
  }

}

const inputs = document.querySelectorAll(".form-img");
inputs.forEach((input) => {
  input.addEventListener("click", openSelector)
})

const pencil = document.getElementById("pencil");
const image = document.getElementById("message_image");
const text = document.querySelector(".add-mails-input");

function clickInput(target) {
  document.querySelector(`.${target}`).click();
}

export { addMail, clickInput }