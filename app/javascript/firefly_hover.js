const fireHower = () => {
  const links = document.querySelectorAll(".hover-links")
  console.log("adad")


  links.forEach((link) => {
    link.addEventListener("mouseover", () => {
      link.querySelector('div').style.display = "block"
    })

    link.addEventListener("mouseleave", () => {
      link.querySelector('div').style.display = "none"
    })
  })
}

export { fireHower }
