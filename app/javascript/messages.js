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
  // console.log(event.currentTarget)
  let input = event.currentTarget
  console.log(input.src)
  // input.click();
}

const inputs = document.querySelectorAll(".input-image");
inputs.forEach((input) => {
  // console.log(input)
  input.addEventListener("click", openSelector)
})

const pencil = document.getElementById("pencil");
const image = document.getElementById("message_image");
const text = document.querySelector(".add-mails-input");

function clickInput(target) {
  document.querySelector(`.${target}`).click();
}

export { addMail, clickInput }