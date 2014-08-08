EBView = require '../EBView'
Modifier = require 'famous/core/Modifier'
ImageSurface = require 'famous/surfaces/ImageSurface'

class EBInstagramListItem extends EBView
  constructor: (imageURL) ->
    super
    content = new ImageSurface content: imageURL
    @contentModifier = new Modifier
      origin: [0.5, 0]
      size: [window.innerWidth - 20
             window.innerWidth - 20]

    @subscribe content
    @pipeThroughTouchEvents()
    @add @contentModifier
    .add content

EBInstagramListItem::getSize = ->
    imageSize = @contentModifier.getSize()
    [imageSize[0] + 10, imageSize[1] + 10]
    # imageSize

module.exports = EBInstagramListItem