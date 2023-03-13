const countdown = () => {
  // const deadline
  // const total = deadline - Date.now
  const dead = document.querySelector("#timer")
  const deadline = document.querySelector("#timer").dataset.date
  const today = Date.now()
  const waiting = new Date(deadline).getTime() - today

  // let days = Math.floor(dista)
  console.log(waiting)
  console.log(today)
  new Date(deadline).getTime()
}

export { countdown }
