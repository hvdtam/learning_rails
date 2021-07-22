// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("channels")
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'jquery'
import 'bootstrap'
import "../stylesheets/application"

Rails.start()
global.toastr = require("toastr")
// Turbolinks.start()
require("turbolinks").start()
ActiveStorage.start()
$(document).on('turbolinks:load', function () {
    console.log("We are ready!")
})