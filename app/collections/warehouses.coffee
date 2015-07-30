`import Ember from 'ember'`
`import D from 'uiux/utils/debug-ex'`
WarehousesCollection = Ember.ArrayProxy.extend
  warehouseSorting: ["batchCount:asc"]

  warehouses: Ember.computed.alias("content")

  warehousesByEmptiness: Ember.computed.sort("warehouses", "warehouseSorting")

  firstEmptyWarehouse: Ember.computed.alias("warehousesByEmptiness.firstObject")

  warehouseChoices: Ember.computed.map "warehousesByEmptiness", (warehouse) ->
    value: warehouse
    presentation: [warehouse.get("nameOrId"), warehouse.getWithDefault("batchesCount", 0)].join(": ")

  batchCounts: Ember.computed.mapBy "warehouses", "batches.length"

  totalBatches: Ember.computed.sum "batchCounts"

WarehousesCollection.fromTiles = (recordArray) ->
  WarehousesCollection.create content: recordArray.filterBy("tileType", "warehouse")

`export default WarehousesCollection`