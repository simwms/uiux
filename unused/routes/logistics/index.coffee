`import Ember from 'ember'`

LogisticsIndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo "logistics.appointments.index",
      queryParams:
        macro: "today"
  

`export default LogisticsIndexRoute`
