`import Ember from 'ember'`

ManagerInventoriesCellRoute = Ember.Route.extend
  model: (cell_id: id)->
    @store.find "tile", id

`export default ManagerInventoriesCellRoute`
