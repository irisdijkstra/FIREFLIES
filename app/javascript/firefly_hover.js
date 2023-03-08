const fireHower = () => {
  const links = document.querySelectorAll(".hover-links")
  console.log("adad")


  links.forEach((link) => {
    link.addEventListener("mouseover", () => {
      // link.getElementByTagName("div")[0] //.style.display = "block"
      link.querySelector('div').style.display = "block"
    })

    link.addEventListener("mouseleave", () => {
      // link.getElementByTagName("div")[0] //.style.display = "block"
      link.querySelector('div').style.display = "none"
    })
  })
}

export { fireHower }
