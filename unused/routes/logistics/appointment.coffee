`import Ember from 'ember'`

LogisticsAppointmentRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "appointment", id

`export default LogisticsAppointmentRoute`
