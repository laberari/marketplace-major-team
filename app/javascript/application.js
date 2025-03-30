// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// Configuración de Stimulus

import { Application } from "@hotwired/stimulus"
const application = Application.start()
application.debug = false
window.Stimulus = application

import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "../stylesheets/application"

export { application } 