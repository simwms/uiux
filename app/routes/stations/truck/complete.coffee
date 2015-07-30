`import Ember from 'ember'`

StationsTruckCompleteRoute = Ember.Route.extend
  model: ->
    @modelFor "stations.truck"

`export default StationsTruckCompleteRoute`
