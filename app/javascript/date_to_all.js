
const dateToAll = (event) => {
  const formAll = document.querySelector("#form-all");
  const dateAll = document.querySelector("#firefly-date-recieve-all");
  const applyAllBtn = document.querySelector("#apply-all-btn");

  const formEach = document.querySelector("#form-each")
  let dateEach = document.querySelectorAll(".test")
  const costumizeBtn = document.querySelector("#costumize-btn");

    applyAllBtn.addEventListener("click", () => {
      dateEach.forEach((date) => {
        if (date.value == dateAll.value){
          date.value = "";
          dateAll.value = "";
        } else {
          date.value = dateAll.value;
        };
      });
    });

    costumizeBtn.addEventListener("click", () => {
      formEach.classList.toggle('d-none');
    });
  };

export { dateToAll }
