View = require 'famous/core/view'

class EBView extends View
  constructor: (options) ->
    super options

EBView::pipeThrough = (events) ->
  if Array.isArray events then @pipeThrough event for event in events
  else @_eventInput.on events, (e) => @_eventOutput.emit events, e

module.exports = EBView