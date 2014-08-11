View = require 'famous/core/View'
EBView = require '../EBView'
Modifier = require 'famous/core/Modifier'
EBMenuBackground = require './EBMenuBackground'
EBButton = require '../EBButton'
Transform = require 'famous/core/Transform'
router = require '../../Router'

class EBMenu extends EBView
  constructor: ->
    super

    menuItems = [
      content: 'Gateways'
      eventName: 'home'
    ,
      content: 'Scan Qr Code'
      eventName: 'scanClicked'
    , 
      content: 'Add Ripple Trade'
      eventName: 'addRippleTradeClicked'
    ]

    for item, index in menuItems
      item.classes = ['menu-item-button']
      button = new EBButton item
      buttonModifier = new Modifier
        transform: Transform.translate 0, 100 * (index + 1), 1e-3
        size: [240, 80]
      @add buttonModifier
      .add button
      @subscribe button 

    @_eventInput.on 'home', ->
      router.navigate '/', trigger: true

    @_eventInput.on 'scanClicked', ->
      router.navigate 'scan-barcode', trigger: true

    @_eventInput.on 'addRippleTradeClicked', ->
      router.navigate 'ripple-trade-login', trigger: true
    
    background = new EBMenuBackground
    @add background

module.exports = EBMenu
