EBView = require './EBView'
Surface = require 'famous/core/Surface'
EBHeader = require './Header/EBHeader'
HeaderFooterLayout = require 'famous/views/HeaderFooterLayout'

class EBContentView extends EBView
  constructor: ->
    super

    layout = new HeaderFooterLayout @options.layout
    # Add content Rednerable
    layout.header = header = new EBHeader
    layout.content = content = new Surface
      content: "Content"
      properties:
        backgroundColor: 'red'
    @add layout

    # Rebroadcast touch events to DrawerLayout
    @subscribe header
    @pipeThrough ['touchstart', 'touchmove', 'touchend', 'toggleMenu']

EBContentView.DEFAULT_OPTIONS =
  layout:
    headerSize: 60
    footerSize: 0

module.exports = EBContentView
