`import Ember from 'ember'`

ManagerDockRoute = Ember.Route.extend
  model: ({dockId}) ->
    @store.find "tile", dockId

`export default ManagerDockRoute`
