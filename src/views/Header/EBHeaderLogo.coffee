EBButton = require '../EBButton'
Transform = require 'famous/core/Transform'
Surface = require 'famous/core/Surface'
ImageSurface = require 'famous/surfaces/ImageSurface'
Modifier = require 'famous/core/Modifier'

class EBHeaderLogo extends EBButton
  constructor: ->
    super

    @content.setContent null
    @contentModifier.setTransform Transform.translate(0, 0, 2)
    @subscribe @content
    @pipeThroughTouchEvents()

    initialTime = Date.now()
    spinningRipple = new ImageSurface
    spinningRipple.setContent 'images/ripple-triskelion.png'

    spinner = new Modifier
      size: [40, 40]
      origin: [0.5, 0.5]
      transform: ->
        Transform.rotateZ 0.0005 * (Date.now() - initialTime)

    @add spinner
    .add spinningRipple

EBHeaderLogo.DEFAULT_OPTIONS =
  ImageSurface: no
  classes: ['eb-header-logo']
  eventName: 'toggleMenu'

module.exports = EBHeaderLogo
