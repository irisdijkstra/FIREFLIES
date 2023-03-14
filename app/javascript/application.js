// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import { addMail }  from './messages.js'
import { fireHower  }  from './firefly_hover.js'
import { dateToAll } from './date_to_all.js'
import { navChange } from "./navbar.js";
import { countdown } from "./countdown.js";
import { faqBox } from "./about.js";

document.addEventListener('turbo:load', () => {
  addMail()
  fireHower()
  dateToAll()
  navChange()
  // countdown()
  faqBox()
});
