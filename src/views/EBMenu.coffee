View = require 'famous/core/View'
Surface = require 'famous/core/Surface'

class EBMenu extends View
  constructor: ->
    super
    content = new Surface
      content: "drawer"
      properties:
        backgroundColor: 'blue'

    @add content

module.exports = EBMenu