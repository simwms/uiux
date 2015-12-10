`import Ember from 'ember'`
`import {processMacro} from 'uiux/collections/appointments'`

{RSVP, Route} = Ember

ManagerRoute = Route.extend
  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/manager",
      outlet: "sidenav"
      into: "apiz"
  model: ->
    RSVP.hash
      appointments: @store.query "appointment", processMacro macro: "today"
      trucks: @store.findAll("onsite-truck")
      batches: RSVP.resolve @store.peekAll "batch"

  actions:
    closeModal: ->
      @transitionTo "manager.index"

`export default ManagerRoute`
