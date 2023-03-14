const addMail = () => {
  const addMailsButton = document.querySelector("#add-mails-btn");
  const addMailsContainer = document.querySelector(".add-mails");
  const mailTag = `<input type='text' name='emails[]' class='add-mails-input'>`;

  if(addMailsButton) {
    addMailsButton.addEventListener("click", () => {
      addMailsContainer.insertAdjacentHTML("afterbegin", mailTag);
    });
  }
}

export { addMail }