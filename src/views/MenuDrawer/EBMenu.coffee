View = require 'famous/core/View'
EBView = require '../EBView'
Modifier = require 'famous/core/Modifier'
EBMenuBackground = require './EBMenuBackground'
EBButton = require '../EBButton'
Transform = require 'famous/core/Transform'

class EBMenu extends EBView
  constructor: ->
    super

    menuItems = [
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
        transform: Transform.translate 0, 100 * (index + 1), 1
        size: [240, 80]
      @add buttonModifier
      .add button
      @subscribe button 

    @pipeThrough ['scanClicked', 'addRippleTradeClicked']
    
    background = new EBMenuBackground
    @add background

module.exports = EBMenu
