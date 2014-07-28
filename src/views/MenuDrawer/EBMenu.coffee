View = require 'famous/core/View'
Modifier = require 'famous/core/Modifier'
EBMenuBackground = require './EBMenuBackground'

class EBMenu extends View
  constructor: ->
    super

    # Add Background
    background = new EBMenuBackground
    @add background

module.exports = EBMenu