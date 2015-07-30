`import Ember from 'ember'`
`import Warehouses from 'uiux/collections/warehouses'`

DocksTruckBatchesNewRoute = Ember.Route.extend
  queryParams:
    warehouse: true
  model: ({warehouse})->
    if warehouse?
      @store.find("tile", warehouse)
      .then (tile) =>
        @setupBatch(tile)
    else
      @setupBatch()

  setupBatch: (tile) ->
    tiles = @modelFor "application"
    warehouses = Warehouses.fromTiles tiles
    truck = @modelFor "docks.truck"
    @store.createRecord "batch",
      appointment: truck.get("appointment")
      permalink: truck.get("appointment.permalink")
      dock: truck.get("dock")
      warehouse: tile or warehouses.get("firstEmptyWarehouse")
      arrivedAt: moment()
      truck: truck
      warehouses: warehouses
      
  tearDown: Ember.on "deactivate", ->
    model = @controller.get "model"
    model.deleteRecord() if Ember.get(model, "hasDirtyAttributes")


`export default DocksTruckBatchesNewRoute`
