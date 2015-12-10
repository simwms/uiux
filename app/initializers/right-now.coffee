# Takes two parameters: container and app
`import Ember from 'ember'`

Clock = Ember.Object.extend
  init: ->
    @_super()
    @set "rightNow", new Date()
    @interval = window.setInterval @incrementTime.bind(@), 1000

  destroy: ->
    window.clearInterval @interval
    @_super()

  incrementTime: ->
    @set "rightNow", new Date()

initialize = (app) ->
  app.register "volatile:clock", Clock
  app.inject "controller", "clock", "volatile:clock"

RightNowInitializer =
  name: 'right-now'
  initialize: initialize

`export {initialize}`
`export default RightNowInitializer`

