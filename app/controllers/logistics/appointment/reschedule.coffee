`import Ember from 'ember'`

LogisticsAppointmentRescheduleController = Ember.Controller.extend
  actions:
    update: ->
      @set("model.explodedAt", null)
      @get("model").save()
      .then (model) => 
        @transitionToRoute "logistics.appointment.index", model.get("id")

`export default LogisticsAppointmentRescheduleController`
