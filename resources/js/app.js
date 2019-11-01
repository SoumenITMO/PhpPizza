import 'bootstrap';
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

require('./bootstrap');
Vue.use(BootstrapVue);
window.Vue = require('vue');

Vue.component('pizza_home', require('./components/Index.vue').default);

Vue.component()

const app = new Vue({
    el: '#app'
});


