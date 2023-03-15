const faqBox = () => {
  let box = document.getElementsByClassName("faq-page");
  let index;

  for (index = 0; index < box.length; index++) {
    box[index].addEventListener("click", function() {
      this.classList.toggle("active");

    let hidden = this.nextElementSibling;
    if (hidden.style.display === "block") {
          hidden.style.display = "none";
    } else {
      hidden.style.display = "block";
    }
    })
  }
}
export { faqBox }
