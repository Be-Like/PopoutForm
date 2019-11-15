require('@rails/ujs').start();
require('@rails/activestorage').start();
require('channels');

import InfoForm from '../infoForm.vue';
import Vue from 'vue';

document.addEventListener('DOMContentLoaded', () => {
  if (document.querySelector('#infoForm')) {
    new Vue({ render: h => h(InfoForm) }).$mount('#infoForm');
  }
});
