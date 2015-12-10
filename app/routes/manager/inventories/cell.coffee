`import Ember from 'ember'`

ManagerInventoriesCellRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "tile", id

`export default ManagerInventoriesCellRoute`
