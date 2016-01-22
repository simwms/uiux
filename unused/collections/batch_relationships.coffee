`import Ember from 'ember'`

TempObject = Ember.Object.extend
  self: Ember.computed -> @
  save: (store) ->
    store.createRecord "batchRelationship",
      batch: @get("batch")
      appointment: @get("appointment")
    .save()

BatchRelationshipsCollection = Ember.ArrayProxy.extend
  persistEverything: (store) ->
    Ember.RSVP.all @get("temporaryRelations").map (relationship) -> relationship.save(store)
  destroyEverything: ->
    Ember.RSVP.all @get("persistedRelations").map (relationship) -> relationship.destroyRecord()

  temporaryRelations: Ember.computed.filter "relationCores", (relationship) -> 
    relationship.get("isLoaded") isnt true
  persistedRelations: Ember.computed.alias "content"
  relationCores: Ember.computed "appointment.id", "content.@each.permaindex", "batches.@each.id", ->
    @get("batches").map (batch) =>
      @findOrCreateRelationship(batch, @get("appointment"))

  findOrCreateRelationship: (batch, appointment) ->
    permaindex = "#{appointment.get("id")}-#{batch.get("id")}"
    return relationship if relationship = @findBy "permaindex", permaindex
    TempObject.create
      batch: batch
      appointment: appointment
      

`export default BatchRelationshipsCollection`