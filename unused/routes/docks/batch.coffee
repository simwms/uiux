`import Ember from 'ember'`

DocksBatchRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "batch", id


`export default DocksBatchRoute`
