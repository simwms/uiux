`import Ember from 'ember'`

DocksCellRoute = Ember.Route.extend
  model: ({id}) ->
    @iogrid.then => @store.find "warehouse", id

`export default DocksCellRoute`
