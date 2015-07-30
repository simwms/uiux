`import Ember from 'ember'`
`import WarehousesCollection from 'uiux/collections/warehouses'`

LogisticsInventoriesRoute = Ember.Route.extend
  model: ->
    @store
    .findAll("tile")
    .then WarehousesCollection.fromTiles

`export default LogisticsInventoriesRoute`
