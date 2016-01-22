`import Ember from 'ember'`

TempObject = Ember.Object.extend
  self: Ember.computed -> @
  save: (store) ->
    store.createRecord "appointmentRelationship",
      dropoff: @get("dropoff")
      pickup: @get("pickup")
    .save()

AppointmentRelationshipsCollection = Ember.ArrayProxy.extend
  relationCores: Ember.computed "pickup.id", "content.@each.permaindex", "dropoffs.@each.id", ->
    @get("dropoffs").map (dropoff) =>
      @findOrCreateRelationship(dropoff, @get("pickup"))

  findOrCreateRelationship: (dropoff, pickup) ->
    permaindex = "#{dropoff.get("id")}-#{pickup.get("id")}"
    return relationship if relationship = @findBy "permaindex", permaindex
    TempObject.create
      dropoff: dropoff
      pickup: pickup
      
`export { TempObject }`
`export default AppointmentRelationshipsCollection`