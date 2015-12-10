`import Ember from 'ember'`

StationRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "tile", id

`export default StationRoute`
