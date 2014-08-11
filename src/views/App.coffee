EBView = require './EBView'
Surface = require 'famous/core/Surface'
Modifier = require 'famous/core/Modifier'
Transform = require 'famous/core/Transform'
RenderNode = require 'famous/core/RenderNode'
DrawerLayout = require '../famousInternal/DrawerLayout'
TouchSync = require 'famous/inputs/TouchSync'
EBMenu = require './MenuDrawer/EBMenu'
EBContentView = require './EBContentView'

###*
 * Top Level App Controller
 * @class App
 * @extends EBView
###
class App extends EBView
  constructor: ->
    super
    layout = @layout = new DrawerLayout @options.layout
    layout.content = content = new EBContentView
    layout.drawer = drawer = new EBMenu

    sync = new TouchSync @options.sync

    content.pipe sync
    sync.pipe layout

    @add layout

    @subscribe content
    @subscribe drawer
    @_eventInput.on 'toggleMenu', =>
      layout.toggle @options.layout.transition

    addRippleTradeSurface = new Surface
      properties: 
        backgroundColor: 'red'

    addRippleTradeSurfaceModifier = new Modifier
      transform: Transform.translate 0, 0, 1
  
    addRippleTrade = new RenderNode
      
    addRippleTrade
    .add addRippleTradeSurfaceModifier 
    .add addRippleTradeSurface 
  
    @_eventInput.on 'addRippleTradeClicked', ->
      content.show addRippleTrade
      layout.close()

    @_eventInput.on 'scanClicked', ->
      layout.close()
      cordova.plugins.barcodeScanner.scan (result) ->
        alert result
      #content.show content.instagramList

App.DEFAULT_OPTIONS =
  layout:
    drawerLength: 260
    positionThreshold: 180
    velocityThreshold: 0.1
    transition:
      method: "spring"
      period: 450
      dampingRatio: 0.6
  sync:
    direction: TouchSync.DIRECTION_X

###*
 * @exports App
###
module.exports = App
