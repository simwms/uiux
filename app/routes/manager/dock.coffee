`import Ember from 'ember'`

ManagerDockRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "tile", id

`export default ManagerDockRoute`
