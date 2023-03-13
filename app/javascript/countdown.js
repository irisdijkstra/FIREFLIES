const countdown = () => {
  const clock = document.getElementById("clock")
  const deadline = document.querySelector("#timer").dataset.date

  let x = setInterval(function() {

  var now = new Date().getTime();
  const waiting = new Date(deadline).getTime() - now

  // const dateCurrentMili = new Date().getTime()
  console.log(new Date(waiting).getTime())


  const dateMili = new Date(deadline).getTime()
  console.log(new Date(dateMili).toString())


  let days = Math.floor(waiting / (1000 * 60 * 60 * 24))
  let remainingWithoutDays = waiting - (days * 1000 * 60 * 60 * 24)

  let hours = Math.floor(remainingWithoutDays / (1000 * 60 * 60 ));

  let minutes = Math.floor((waiting % (1000 * 60 * 60)) / (1000 * 60));
  let seconds = Math.floor((waiting % (1000 * 60)) / 1000);

  clock.innerHTML = days + " days " + hours + " hours "+ minutes + " minutes " + seconds + " seconds ";

}, 1000);


  console.log(deadline)
  console.log(waiting)
  console.log(days)
  console.log(hours)
  console.log(minutes)
  console.log(seconds)
}

export { countdown }
