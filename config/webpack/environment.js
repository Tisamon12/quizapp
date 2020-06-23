const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const pug = require('./loaders/pug')
const vuetify = require('./loaders/vuetify')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('pug', pug)
environment.loaders.prepend('vue', vue)
environment.loaders.prepend('vuetify', vuetify)
module.exports = environment
