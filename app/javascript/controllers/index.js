// Import all the controllers
import { Application } from "@hotwired/stimulus"
const application = Application.start()

// Lazy load controllers
const context = require.context("./", true, /\.js$/)
application.load(context)
