// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import { addMail }  from './messages.js'
import { fireHower  }  from './firefly_hover.js'

document.addEventListener('turbo:load', () => {
  addMail()
  fireHower()
});
