`import Ember from 'ember'`

ManagerTrucksTruckRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "truck", id

`export default ManagerTrucksTruckRoute`
