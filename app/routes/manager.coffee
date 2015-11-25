`import Ember from 'ember'`
`import {processMacro} from 'uiux/collections/appointments'`

{RSVP, Route} = Ember

ManagerRoute = Route.extend
  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/manager",
      outlet: "sidenav"
  model: ->
    RSVP.hash
      appointments: @store.query "appointment", processMacro macro: "today"
      trucks: @store.findAll("truck").filterBy("departedAt", null)
      batches: RSVP.resolve @store.peekAll "batch"

`export default ManagerRoute`
