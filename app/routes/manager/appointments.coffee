`import Ember from 'ember'`

ManagerAppointmentsRoute = Ember.Route.extend
  model: ->
    @modelFor("manager").appointments

`export default ManagerAppointmentsRoute`
