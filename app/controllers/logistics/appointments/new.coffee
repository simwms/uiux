`import Ember from 'ember'`
`import validate from 'uiux/validators/appointment'`
`import AtomicMixin from 'uiux/mixins/atomic'`
`import moment from 'moment'`
`import {withinWorkingHours} from 'uiux/utils/punch-card'`
`import CPM from 'ember-cpm'`

invalidMsg = """
Your new appointment did not pass validation, tough break kid.
"""
appointmentChoices = Ember.A ["dropoff", "pickup", "both"]
.map (v) -> 
  value: v
  presentation: v

LogisticsAppointmentsNewController = Ember.Controller.extend AtomicMixin,
  pickupTypeSelected: CPM.Macros.among "appointment.appointmentType", "pickup", "both"
  appointmentChoices: appointmentChoices
  appointment: Ember.computed.alias "model"
  withinWorkingHours: Ember.computed "appointment.expectedAt", ->
    withinWorkingHours @get "appointment.expectedAt"

  validateModel: ->
    validate @get "model"

  actions:
    create: ->
      @atomically =>
        @validateModel()
        .then (appointment) ->
          appointment.save()
        .catch ({errors}) =>
          @set "appointmentError", errors
          Ember.assert invalidMsg, errors
        .then (appointment) =>
          switch appointment.get("appointmentType")
            when "dropoff"
              @transitionToRoute "logistics.appointments.index",
                queryParams:
                  macro: "today"
              @send "updateAppointments"
            else
              @transitionToRoute "logistics.appointment.relate", appointment.get("id")

`export default LogisticsAppointmentsNewController`
