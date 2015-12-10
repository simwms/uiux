`import Ember from 'ember'`

StationsTruckRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "truck", id

`export default StationsTruckRoute`
