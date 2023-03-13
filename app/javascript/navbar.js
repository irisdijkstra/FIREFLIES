const navChange= () => {
  const navbar = document.querySelector(".nav-firefly");

  window.addEventListener('scroll', () => {
    if (window.scrollY > 700) {
      navbar.classList.add('navColor');
  } else {
      navbar.classList.remove('navColor');
  }
  })

};

export {navChange};
