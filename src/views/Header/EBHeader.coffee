Surface = require 'famous/core/Surface'
View = require '../EBView'

class EBHeader extends View
  constructor: ->
    super

    content = new Surface
      content: "Header"
      properties:
        backgroundColor: 'blue'

    @add content
    content.pipe @
    @pipeThrough ['touchstart', 'touchmove', 'touchend']

module.exports = EBHeader