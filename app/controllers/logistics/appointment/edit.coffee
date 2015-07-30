`import Ember from 'ember'`
`import {typeChoices} from 'uiux/collections/appointments'`
LogisticsAppointmentEditController = Ember.Controller.extend
  appointmentChoices: typeChoices
  actions:
    update: ->
      @get("model").save()
      .then (model) => 
        @transitionToRoute "logistics.appointment.index", model.get("id")

`export default LogisticsAppointmentEditController`
