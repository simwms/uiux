`import Ember from 'ember'`
`import WarehousesCollection from 'uiux/collections/warehouses'`
ManagerInventoriesRoute = Ember.Route.extend
  model: ->
    WarehousesCollection.fromTiles @modelFor("manager").tiles

`export default ManagerInventoriesRoute`
