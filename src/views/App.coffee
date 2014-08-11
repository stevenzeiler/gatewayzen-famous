EBView = require './EBView'
Surface = require 'famous/core/Surface'
Modifier = require 'famous/core/Modifier'
Transform = require 'famous/core/Transform'
RenderNode = require 'famous/core/RenderNode'
DrawerLayout = require '../famousInternal/DrawerLayout'
TouchSync = require 'famous/inputs/TouchSync'
EBMenu = require './MenuDrawer/EBMenu'
EBContentView = require './EBContentView'
Backbone = require 'backbone'
router = require '../Router'
_ = require 'underscore-node'
$ = require 'jquery'

###*
 * Top Level App Controller
 * @class App
 * @extends EBView
###
class App extends EBView
  constructor: ->
    super
    layout = @layout = new DrawerLayout @options.layout
    layout.content = @content = content = new EBContentView
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
      content: _.template($('#rippleTradeLoginForm').html())()
    addRippleTradeSurfaceModifier = new Modifier
      transform: Transform.translate 0, 0, 1
    @addRippleTrade = addRippleTrade = new RenderNode
    addRippleTrade
    .add addRippleTradeSurfaceModifier 
    .add addRippleTradeSurface 

    scanResultSurface = @scanResultSurface  = new Surface
    scanResultModifier = new Modifier
      transform: Transform.translate 0, 0, 1
    @scanResult = scanResult = new RenderNode
    scanResult
    .add scanResultModifier 
    .add scanResultSurface 

    router.on 'route:rippleTradeLogin', =>
      @showRippleTradeLogin()

    router.on 'route:home', =>
      @showInstagramList()

    router.on 'route:scanBarcode', =>
      @scanQrCode()

    router.on 'route:scanResult', (result) =>
      @showScanResult result

    Backbone.history.start()

App::showRippleTradeLogin = ->
  @content.content.show @addRippleTrade
  @layout.close()

App::showScanResult = (result) ->
  templateValue = result: result
  content = _.template($('#scanResult').html())(templateValue) 
  @scanResultSurface.setContent content
  @content.content.show @scanResult
  @layout.close()

App::showInstagramList = ->
  @content.showInstagramList()
  @layout.close()

App::scanQrCode = ->
  @layout.close()
  onSuccessfulScan = (result) ->
    console.log result
    router.navigate '/scan-result/'+result.text, trigger: true
  onScanError = (error) ->
    console.log 'error', error
    router.navigate '/', trigger: true
  cordova.plugins.barcodeScanner.scan onSuccessfulScan, onScanError

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
