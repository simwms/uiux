`import Ember from 'ember'`
`import InventoriesIndexController from 'uiux/controllers/inventories/index'`

DocksInventoriesIndexController = InventoriesIndexController.extend
  actions:
    touchCell: (cell) ->
      @transitionToRoute "docks.cell", cell.get("id")

`export default DocksInventoriesIndexController`
