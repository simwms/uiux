`import Ember from 'ember'`

LogisticsInventoriesBatchRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "batch", id

`export default LogisticsInventoriesBatchRoute`