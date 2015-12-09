`import Ember from 'ember'`
`import D from 'uiux/utils/debug-ex'`

{computed, ArrayProxy} = Ember
{alias, sort, map, sum, mapBy} = computed
WarehousesCollection = Ember.ArrayProxy.extend
  warehouseSorting: ["batchCount:asc"]

  warehouses: alias("content")

  warehousesByEmptiness: sort("warehouses", "warehouseSorting")

  firstEmptyWarehouse: alias("warehousesByEmptiness.firstObject")

  warehouseChoices: map "warehousesByEmptiness", (warehouse) ->
    value: warehouse
    presentation: [warehouse.get("nameOrId"), warehouse.getWithDefault("batchesCount", 0)].join(": ")

  batchCounts: mapBy "warehouses", "batches.length"

  totalBatches: sum "batchCounts"

WarehousesCollection.fromTiles = (recordArray) ->
  WarehousesCollection.create content: recordArray.filterBy("isCellType")

`export default WarehousesCollection`