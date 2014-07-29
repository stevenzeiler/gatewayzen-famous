EBButton = require '../EBButton'
Transform = require 'famous/core/Transform'
Surface = require 'famous/core/Surface'
Modifier = require 'famous/core/Modifier'

class EBHeaderLogo extends EBButton
  constructor: ->
    super

    @content.setContent 'images/eb_logo.png'
    @contentModifier.setTransform Transform.translate(0, 0, 2)
    @subscribe @content
    @pipeThrough ['touchstart', 'touchmove', 'touchend']

    initialTime = Date.now()
    spinningWhiteThing = new Surface
      properties:
        backgroundColor: 'white'
    spinner = new Modifier
      size: [40, 40]
      origin: [0.5, 0.5]
      transform: ->
        Transform.rotateZ 0.0005 * (Date.now() - initialTime)

    @add spinner
    .add spinningWhiteThing

EBHeaderLogo.DEFAULT_OPTIONS =
  ImageSurface: yes
  classes: ['eb-header-logo']
  eventName: 'toggleMenu'
  properties:
    padding: '10px'

module.exports = EBHeaderLogo