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

function openSelector(input) {
  input.click();
}

const pencil = document.getElementById("pencil");
const image = document.getElementById("message_image");
const text = document.querySelector(".add-mails-input");
// pencil.addEventListener("click", (e) => {
//   e.preventDefault();
//   const input1 = document.querySelector(".input1");
//   input1.click();
// });

function clickInput(target) {
  document.querySelector(`.${target}`).click();
}

export { addMail, clickInput }