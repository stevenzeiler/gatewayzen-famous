EBView = require './EBView'
Surface = require 'famous/core/Surface'
EBHeader = require './Header/EBHeader'
HeaderFooterLayout = require 'famous/views/HeaderFooterLayout'
RenderController = require 'famous/views/RenderController'
EBInstagramList = require './content/EBInstagramList'

class EBContentView extends EBView
  constructor: ->
    super

    layout = new HeaderFooterLayout @options.layout
    # Add content Rednerable
    layout.header = header = new EBHeader
    layout.content = content = new RenderController @options.renderController

    instagramList = new EBInstagramList
    content.show instagramList
    @add layout

    # Rebroadcast touch events to DrawerLayout
    @subscribe header
    @pipeThroughTouchEvents()
    @pipeThrough "toggleMenu"

EBContentView.DEFAULT_OPTIONS =
  layout:
    headerSize: 60
    footerSize: 0
  renderController: {}

module.exports = EBContentView
