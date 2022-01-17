// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/frontend and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
ActiveStorage.start()

import '../styles/application.scss'
const images = require.context('../images', true)

import 'bootstrap/dist/js/bootstrap'
import '../scripts/event_map.js'
import 'lightbox2/dist/js/lightbox-plus-jquery'