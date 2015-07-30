`import Ember from 'ember'`

StationsTruckRoute = Ember.Route.extend
  model: ({truckId}) ->
    @store.find "truck", truckId

`export default StationsTruckRoute`
