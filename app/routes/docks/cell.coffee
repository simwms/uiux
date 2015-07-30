`import Ember from 'ember'`

DocksCellRoute = Ember.Route.extend
  model: (cell_id: id)->
    @iogrid.then => @store.find "warehouse", id

`export default DocksCellRoute`
