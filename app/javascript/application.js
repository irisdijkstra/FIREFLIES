// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { addMail }  from './messages.js'

document.addEventListener('turbo:load', () => {
  addMail()
});
