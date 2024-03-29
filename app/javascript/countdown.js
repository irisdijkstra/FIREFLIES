const countdown = () => {
  const clock = document.getElementById("clock")
  const deadline = document.querySelector("#timer").dataset.date

  let x = setInterval(function() {

  var now = new Date().getTime();
  const waiting = new Date(deadline).getTime() - now

  const dateMili = new Date(deadline).getTime()


  let days = Math.floor(waiting / (1000 * 60 * 60 * 24))
  let remainingWithoutDays = waiting - (days * 1000 * 60 * 60 * 24)

  let hours = Math.floor(remainingWithoutDays / (1000 * 60 * 60 ));

  let minutes = Math.floor((waiting % (1000 * 60 * 60)) / (1000 * 60));
  let seconds = Math.floor((waiting % (1000 * 60)) / 1000);

  clock.innerHTML = ('0' + days).slice(-2) + "d - " + ('0' + hours).slice(-2) +"h - "+ ('0' + minutes).slice(-2) + "m - " + ('0' + seconds).slice(-2) + "s ";


}, 1000);
}

export { countdown }
