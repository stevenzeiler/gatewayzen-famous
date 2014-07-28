Engine = require 'famous/core/Engine'

# Register Spring Transition
Transitionable = require 'famous/transitions/Transitionable'
SpringTransition = require 'famous/transitions/SpringTransition'
Transitionable.registerMethod 'spring', SpringTransition

# Create context and set Perspective
mainContext = Engine.createContext()
mainContext.setPerspective 1000

# Add app to the mainContext
App = require './views/App'
mainContext.add new App
