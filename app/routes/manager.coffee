`import Ember from 'ember'`
`import {processMacro} from 'uiux/collections/appointments'`

ManagerRoute = Ember.Route.extend
  model: ->
    batches = @store.peekAll "batch"
    Ember.RSVP.hash
      tiles: @store.findAll "tile"
      appointments: @store.query "appointment", processMacro macro: "today"
      trucks: @store.findAll("truck").filterBy("departedAt", null)
    .then ({trucks, appointments, tiles}) -> {trucks, batches, tiles, appointments}

`export default ManagerRoute`
