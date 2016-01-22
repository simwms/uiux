`import Ember from 'ember'`
`import {processMacro} from 'uiux/utils/process-query'`

{RSVP, Route} = Ember
isLive = (model) -> 
  now = moment()
  liveAt = model.get("goliveAt")
  killAt = model.getWithDefault("unliveAt", moment().add(1, "year"))
  liveAt < now < killAt

ManagerRoute = Route.extend
  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/manager",
      outlet: "sidenav"
      into: "apiz"
  model: ->
    RSVP.hash
      appointments: @store.findAll "appointment" # @store.filter "appointment", processMacro("live"), isLive
      trucks: @store.filter "truck", processMacro("live"), isLive
      batches: @store.filter "batch", processMacro("live"), isLive

  actions:
    closeModal: ->
      @transitionTo "manager.index"

`export default ManagerRoute`
