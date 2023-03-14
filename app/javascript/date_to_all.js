
const dateToAll = (event) => {
  const dateAll = document.querySelector("#firefly-date-recieve-all");
  const applyAllBtn = document.querySelector("#apply-all-btn");

  const formEach = document.querySelector("#form-each")
  let dateEach = document.querySelectorAll(".date-form")
  const costumizeBtn = document.querySelector("#costumize-btn");

  const formActions = document.querySelectorAll(".simple_form")
  const sendBtn = document.querySelector("#send-btn")

  if(applyAllBtn) {
    // when clicked, main date will be applied to all fireflies
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
  };

  if(costumizeBtn) {
    // when clicked, costumize dates will be shown for different fireflies
    costumizeBtn.addEventListener("click", () => {
      formEach.classList.toggle('d-none');
    });
  };

  if(sendBtn) {
    sendBtn.addEventListener("click", () => {
    // if clicked, all dates will be saved for fireflies
      dateEach.forEach((date) => {
      if (date.value == "") {
        date.value = dateAll.value;
      }
    });

        formActions.forEach((form) => {
        // (field.action) => this is the URL to where the firefly will be patched
          fetch(form.action, {
            method: "PATCH",
            headers: {"Accept": "text/plain"},
            body: new FormData(form)
          })
          // .then((response) => response.text())
          // .then((data) => console.log(data))
          // console.log(new FormData(field))
        });
        window.location.href = "http://localhost:3000/timeline"
    });
  };
};

export { dateToAll }
