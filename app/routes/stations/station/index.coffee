`import Ember from 'ember'`
`import { processMacro } from 'uiux/collections/appointments'`

StationsStationIndexRoute = Ember.Route.extend
  model: ->
    Ember.RSVP.hash
      station: @modelFor "stations.station"
      appointments: @store.find "appointment", processMacro macro: "today"

`export default StationsStationIndexRoute`
