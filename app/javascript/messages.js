const addMail = () => {
  const addMailsButton = document.querySelector(".add-mails-btn");
  const addMailsContainer = document.querySelector(".add-mails");
  const mailTag = "<input type='text' name='emails[]' class='form-control'>";

  addMailsButton.addEventListener("click", () => {
    addMailsContainer.insertAdjacentHTML("beforeend", mailTag);
  });
}

export { addMail }
