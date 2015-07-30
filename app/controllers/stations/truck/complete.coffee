`import Ember from 'ember'`
`import AtomicMixin from 'uiux/mixins/atomic'`

StationsTruckCompleteController = Ember.Controller.extend AtomicMixin,
  truck: Ember.computed.alias "model"
  weighticket: Ember.computed.alias "model.weighticket"
  appointment: Ember.computed.alias "model.appointment"
  actions:
    completeTicket: ->
      truck = @get("truck")
      truck.set "departedAt", moment()
      Ember.RSVP.hash
        weighticket: @get("weighticket")
        appointment: @get("appointment")
      .then ({weighticket, appointment}) ->
        appointment.set "fulfilledAt", moment()
        Ember.RSVP.hash
          appointment: appointment.save()
          weighticket: weighticket.save()
          truck: truck.save()
      .then ({truck}) =>
        @transitionToRoute "stations.truck.exit", @get "truck.id"
      .catch (errors) =>
        @set "mistakes", errors

`export default StationsTruckCompleteController`
