View = require 'famous/core/View'
Surface = require 'famous/core/Surface'
HeaderFooterLayout = require 'famous/views/HeaderFooterLayout'

###*
 * Top Level App Controller
 * @class App
 * @extends View
###
class App extends View
  constructor: ->
    super
    @layout = new HeaderFooterLayout @options.layout
    @layout.header = new Surface
      content: "Header"
      properties:
        backgroundColor: 'red'

    @layout.content = new Surface
      content: "Energies Balanced"
      properties:
        backgroundColor: 'blue'
    @add @layout

App.DEFAULT_OPTIONS =
  layout:
    headerSize: 60
    footerSize: 0

###*
 * @exports App
###
module.exports = App