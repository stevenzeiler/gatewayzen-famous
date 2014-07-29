EBView = require './EBView'
Surface = require 'famous/core/Surface'
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
    layout.drawer = drawer = new EBMenu
    layout.content = content = new EBContentView

    sync = new TouchSync @options.sync

    content.pipe sync
    sync.pipe layout

    @add layout

    @subscribe content
    @subscribe drawer
    @_eventInput.on 'toggleMenu', =>
      layout.toggle @options.layout.transition

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
