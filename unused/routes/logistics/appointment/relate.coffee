`import Ember from 'ember'`
`import {processMacro} from 'uiux/collections/appointments'`
`import AppointmentRelationshipsCollection from 'uiux/collections/appointment_relationships'`
`import BatchRelationshipsCollection from 'uiux/collections/batch_relationships'`

processAppointmentSearch = (search) ->
  hash = processMacro macro: "all-dropoffs"
  hash.search = search
  hash.per_page = 1024
  hash

LogisticsAppointmentRelateRoute = Ember.Route.extend
  queryParams:
    search:
      refreshModel: false
  model: ({search})->
    pickup = @modelFor "logistics.appointment"
    Ember.RSVP.hash
      dropoffs: @store.find("appointment", processAppointmentSearch search)
      ars: @store.find("appointmentRelationship", pickup_id: pickup.get("id"))
    .then ({dropoffs, ars}) ->
      pickup: pickup
      appointmentRelationships: AppointmentRelationshipsCollection.create
        content: ars
        pickup: pickup
        dropoffs: dropoffs

  actions:
    refresh: -> @refresh()
      
      


`export default LogisticsAppointmentRelateRoute`
