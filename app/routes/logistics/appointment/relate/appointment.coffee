`import Ember from 'ember'`
`import {TempObject} from 'uiux/collections/appointment_relationships'`
`import BatchRelationshipsCollection from 'uiux/collections/batch_relationships'`
`import D from 'uiux/utils/debug-ex'`

LogisticsAppointmentRelateAppointmentRoute = Ember.Route.extend
  model: ({id}) ->
    pickup = @modelFor "logistics.appointment"
    @store.find("appointment", id)
    .then (dropoff) =>
      Ember.RSVP.hash
        batches: dropoff.get("batches")
        brs: @store.find("batchRelationship", appointment_id: pickup.get("id"))
        ar: @findOrInitialize("appointmentRelationship", {pickup, dropoff})
      .then ({batches, brs, ar}) ->
        pickup: pickup
        dropoff: dropoff
        appointmentRelationship: ar
        batchRelationships: BatchRelationshipsCollection.create
          content: brs
          appointment: pickup
          batches: batches

  afterModel: (model) ->
    {batchRelationships, appointmentRelationship} = model
    batches = batchRelationships.get("batches")

    # one batch relationship, but no appointment relationship
    if batchRelationships.get("length") is 1
      if appointmentRelationship.get("isLoaded") isnt true
        appointmentRelationship.save(@store).then =>
          @send "refresh"
          @refresh()

    # appointment relationship not there, available batches, but no batch relationships
    if appointmentRelationship.get("isLoaded") is true
      if batches.get("length") > 0
        if batchRelationships.get("length") is 0
          appointmentRelationship.destroyRecord().then =>
            @send "refresh"
            @refresh()

  findOrInitialize: (modelName, {pickup, dropoff}) ->
    @store.find "appointmentRelationship",
      pickup_id: pickup.get("id")
      dropoff_id: dropoff.get("id")
    .then (relationships) -> 
      if r = relationships.get("firstObject")
        r
      else
        TempObject.create {pickup, dropoff}

  actions:
    refresh: ->
      @refresh()
      true

`export default LogisticsAppointmentRelateAppointmentRoute`