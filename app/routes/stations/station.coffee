`import Ember from 'ember'`

StationsStationRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "tile", id

`export default StationsStationRoute`
