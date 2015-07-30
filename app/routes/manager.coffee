`import Ember from 'ember'`
`import {processMacro} from 'uiux/collections/appointments'`

ManagerRoute = Ember.Route.extend
  model: ->
    tiles = @modelFor "application"
    batches = @store.peekAll "batch"
    Ember.RSVP.hash
      appointments: @store.query "appointment", processMacro macro: "today"
      trucks: @store.findAll("truck").filterBy("departedAt", null)
    .then ({trucks, appointments}) -> {trucks, batches, tiles, appointments}

`export default ManagerRoute`
