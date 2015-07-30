`import Ember from 'ember'`

DocksBatchRoute = Ember.Route.extend
  model: (batchId: id) ->
    @store.find "batch", id


`export default DocksBatchRoute`
