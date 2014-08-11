EBView = require './EBView'
Surface = require 'famous/core/Surface'
Modifier = require 'famous/core/Modifier'
Transform = require 'famous/core/Transform'
EBHeader = require './Header/EBHeader'
HeaderFooterLayout = require 'famous/views/HeaderFooterLayout'
RenderController = require 'famous/views/RenderController'
EBInstagramList = require './content/EBInstagramList'

class EBContentView extends EBView
  constructor: ->
    super

    contentBackground = new Surface properties: backgroundColor: '#FFC897'
    contentBackgroundModifier = new Modifier transform: Transform.translate 0, 0, 1
    @add contentBackgroundModifier
    .add contentBackground

    layout = new HeaderFooterLayout @options.layout
    # Add content Rednerable
    layout.header = header = new EBHeader
    layout.content = @content = content = new RenderController @options.renderController

    @instagramList = instagramList = new EBInstagramList
    @content.show instagramList

    @add layout

    # Rebroadcast touch events to DrawerLayout
    @subscribe header
    @pipeThroughTouchEvents()
    @pipeThrough "toggleMenu"

  show: ->
    return @content.show.apply @content, arguments

  showInstagramList: ->
    @show @instagramList
    

EBContentView.DEFAULT_OPTIONS =
  layout:
    headerSize: 60
    footerSize: 0
  renderController: {}

module.exports = EBContentView
