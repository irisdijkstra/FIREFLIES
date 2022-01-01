const addMail = () => {
  const addMailsButton = document.querySelector("#add-mails-btn");
  const addMailsContainer = document.querySelector(".add-mails");
  const scrolll = document.querySelector(".messages-cont");
  // const mailTag = `<input type="text" name="emails[]" class="add-mails">`;
  const mailTag = `<input type="text" name="emails[]" class="add-mails-input" placeholder="TO (e-mail):">`;

  if(addMailsButton) {
    addMailsButton.addEventListener("click", () => {
      addMailsContainer.insertAdjacentHTML("beforeend", mailTag);
      scrolll.scroll(scrolll.scrollHeight, 0)
      console.log("reached function ID")
    });
  }
}

export { addMail }
