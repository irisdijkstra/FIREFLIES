const addMail = () => {
  const addMailsButton = document.querySelector("#add-mails-btn");
  const addMailsContainer = document.querySelector(".add-mails");
  const mailTag = `<div class="add-mails" type="text" name="emails[]" class="btn-form-blue add-mails-input">`;

  if(addMailsButton) {
    addMailsButton.addEventListener("click", () => {
      addMailsContainer.insertAdjacentHTML("afterend", mailTag);
    });
  }
}

export { addMail }
