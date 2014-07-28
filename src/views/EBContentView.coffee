View = require './EBView'
Surface = require 'famous/core/Surface'

class EBContentView extends View
  constructor: ->
    super
    content = new Surface
      content: "Content"
      properties:
        backgroundColor: 'red'

    @add content

    # Rebroadcast touch events to DrawerLayout
    content.pipe @
    @pipeThrough ['touchstart', 'touchmove', 'touchend']

module.exports = EBContentView
