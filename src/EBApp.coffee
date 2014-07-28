Engine = require 'famous/core/Engine'
App = require './views/App'

mainContext = Engine.createContext()
mainContext.setPerspective 1000
mainContext.add new App
