
const checkboxActive = (event) => {
  console.log("hi inside")
  event.preventDefault()

  const formAll = document.querySelector("#form-all");
  const dateAll = document.querySelector("#date-all");
  const applyAllBtn = document.querySelector("#apply-all-btn");

  const formEach = document.querySelector("#form-each")
  const costumizeBtn = document.querySelector("#costumize-btn");

    if(applyAllBtn) {
      applyAllBtn.addEventListener("click", () => {
        // logic for applying all dates to formAll
        // if time: button to remove all dates from formAll
        formEach.insertAdjacentHTML("beforeend", "test");
      });
    } else {
      costumizeBtn.addEventListener("click", () => {
        // logic for removing d-none for formEach (costumize option)
        formEach.style.display("d-none")
      });
    }

}

export { checkboxActive }
