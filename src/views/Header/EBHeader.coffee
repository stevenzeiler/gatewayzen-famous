Surface = require 'famous/core/Surface'
Modifier = require 'famous/core/Modifier'
Transform = require 'famous/core/Transform'
EBView = require '../EBView'
HeaderFooterLayout = require 'famous/views/HeaderFooterLayout'
EBHeaderLogo = require './EBHeaderLogo'

class EBHeader extends EBView
  constructor: ->
    super

    forwardNode = @add new Modifier transform: Transform.translate 0, 0, 10

    #Add background surface
    background = new Surface @options.background
    @subscribe background
    forwardNode.add background

    #Add header footer layout for header icon nav
    layout = new HeaderFooterLayout @options.layout
    forwardNode.add layout

    #Add logo button to reveal drawer
    layout.header = logo = new EBHeaderLogo
    @subscribe logo

    layout.content = @headerLabel = new Surface @options.label
    @subscribe @headerLabel

    @pipeThroughTouchEvents()
    @pipeThrough "toggleMenu"

EBHeader.DEFAULT_OPTIONS =
  background:
    properties:
      backgroundColor: '#A61C15'
  label:
    content: '<p style="margin:10px 0px 0px 20px">Gateway Zen</p>'
    properties:
      color: 'white'
      fontSize: '25px'
  layout:
    direction: HeaderFooterLayout.DIRECTION_X
    headerSize: 60,
    footerSize: 60

EBHeader::setTitle = (title) ->
  @headerLabel.setContent title

module.exports = EBHeader
