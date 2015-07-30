`import Ember from 'ember'`
`import AtomicMixin from 'uiux/mixins/atomic'`
a = Ember.computed.alias

LogisticsAppointmentRelateAppointmentController = Ember.Controller.extend AtomicMixin,
  pickup: a "model.pickup"
  dropoff: a "model.dropoff"
  batchRelationships: a "model.batchRelationships.relationCores"
  appointmentRelationship: a "model.appointmentRelationship"
  persistedRelations: a "model.batchRelationships.persistedRelations"

  destroyAllBatchRelationships: ->
    @get("model.batchRelationships").destroyEverything()

  persistAllBatchRelationships: ->
    @get("model.batchRelationships").persistEverything(@store)

  actions:
    toggleBatch: (relationship) ->
      @atomically =>
        if relationship.get("isLoaded")
          promise = relationship.destroyRecord()
        else
          promise = relationship.save @store
        promise.then =>
          @send "refresh"

    toggleAppointment: ->
      relationship = @get "appointmentRelationship"
      @atomically =>
        if relationship.get("isLoaded")
          promise = @destroyAllBatchRelationships()
          .then -> relationship.destroyRecord()
        else
          promise = @persistAllBatchRelationships()
          .then => relationship.save @store
        promise.then => 
          @send "refresh"

`export default LogisticsAppointmentRelateAppointmentController`