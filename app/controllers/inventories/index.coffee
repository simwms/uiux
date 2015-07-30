`import Ember from 'ember'`

InventoriesIndexController = Ember.Controller.extend
  colNames: "abcde".split("")
  rowNames: [2..12]

  warehouses: Ember.computed.alias("model")

  actions:
    touchCell: (cell) ->
      throw new Error "unimplemented"

`export default InventoriesIndexController`
