`import Ember from 'ember'`

StationRoute = Ember.Route.extend
  model: ({stationId}) ->
    @store.find "tile", stationId

`export default StationRoute`
