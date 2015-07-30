`import Ember from 'ember'`

LogisticsInventoriesCellRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "tile", id

`export default LogisticsInventoriesCellRoute`