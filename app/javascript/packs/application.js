require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import InfoForm from '../infoForm.vue'
import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('#infoForm')) {
    new Vue({ render: h => h(InfoForm) }).$mount('#infoForm')
  }
})
