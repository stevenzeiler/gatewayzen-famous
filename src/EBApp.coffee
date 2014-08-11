Engine = require 'famous/core/Engine'

# Register Spring Transition
Transitionable = require 'famous/transitions/Transitionable'
SpringTransition = require 'famous/transitions/SpringTransition'
Transitionable.registerMethod 'spring', SpringTransition
require 'famous/inputs/FastClick'

# Create context and set Perspective
mainContext = Engine.createContext()
mainContext.setPerspective 8000

# Add app to the mainContext
App = require './views/App'
app = new App
mainContext.add app

