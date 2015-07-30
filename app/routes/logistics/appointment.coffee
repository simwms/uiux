`import Ember from 'ember'`

LogisticsAppointmentRoute = Ember.Route.extend
  model: (appointment_id: id) ->
    @store.find "appointment", id

`export default LogisticsAppointmentRoute`
