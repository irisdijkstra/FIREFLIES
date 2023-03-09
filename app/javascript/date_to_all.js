
const dateToAll = (event) => {
  const formAll = document.querySelector("#form-all");
  const dateAll = document.querySelector("#firefly-date-recieve-all");
  const applyAllBtn = document.querySelector("#apply-all-btn");

  const formEach = document.querySelector("#form-each")
  let dateEach = document.querySelectorAll(".date-form")
  const costumizeBtn = document.querySelector("#costumize-btn");

  const formActions = document.querySelectorAll(".simple_form")
  const sendBtn = document.querySelector("#send-btn")

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

    // sendBtn.addEventListener("click", () => {
    //   // if clicked, all dates will be saved for fireflies
    //   //console.log(sendBtn)
    //   //console.log(formActions)

    //   formActions.forEach((form) => {
    //     //const csrfToken = document.querySelector("[name='csrf-token']").content;
    //     //console.log(csrfToken);

    //     //console.log(form.action)

    //     // This will display the date for (each) form
    //     //console.log(form.querySelector(".date-form").value)

    //     fetch(form.action, {
    //       method: "PATCH",
    //       headers: { "Accept": "text/plain"},
    //       body: new FormData(form)
    //     })
    //     .then((response) => response.text())
    //     .then((data) => console.log(data))
    //   });

    // });
  };

export { dateToAll }
