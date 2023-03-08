// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

const addMailsButton = document.querySelector(".add-mails-btn");
const addMailsInput = document.querySelector(".add-mails-input");
const mailTag = "<input type='text' name='email' class='form-control'>";
console.log("hi outside")

addMailsButton.addEventListener("click", (event) => {
  console.log("hi")

  fetch("app/views/messages/_form.html.erb")
  .then(response => response.text())
  .then((data) => {
    console.log(data)
  })

  addMailsInput.insertAdjacentHTML("beforeend", mailTag);
});
