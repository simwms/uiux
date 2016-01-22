`import Ember from 'ember'`

uniqueBy = (key) ->
  hash = {}
  (array, thing) ->
    return array if hash[thing.get(key)]?
    hash[thing.get(key)] = true
    array.pushObject thing
    array

BatchesCollection = Ember.ArrayProxy.extend
  batches: Ember.computed.alias "content"
  uniqAppointmentCount: Ember.computed.alias "uniqAppointmentBatches.length"
  appointments: Ember.computed.mapBy "batches", "appointment"
  uniqAppointments: Ember.computed "appointments.@each.id", ->
    @get("appointments").reduce(uniqueBy("id"), Ember.A())
  uniqAppointmentBatches: Ember.computed "batches.@each.appointment.id", ->
    @get("batches").reduce(uniqueBy("appointment.id"), Ember.A())
    
BatchesCollection.fromBatches = (batches) ->
  BatchesCollection.create content: batches

`export default BatchesCollection`
