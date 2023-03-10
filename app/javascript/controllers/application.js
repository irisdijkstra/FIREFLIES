import { Application } from "@hotwired/stimulus"

console.log("application.js received")

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
