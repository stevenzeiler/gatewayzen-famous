$ = require "jquery"
Backbone = require "backbone"
Backbone.$ = $

Router = Backbone.Router.extend
  routes:
    "": "home"
    "ripple-trade-login": "rippleTradeLogin"
    "scan-barcode": "scanBarcode"
    "scan-result/:result": "scanResult"
    "ripple-trade-account": "rippleTradeAccount"

module.exports = new Router

