`import Ember from 'ember'`
`import validate from 'uiux/validators/batch'`
`import {Atomic} from 'simwms-shared'`

DocksTruckBatchesNewController = Ember.Controller.extend Atomic,
  warehouseChoices: Ember.computed.alias("model.warehouses.warehouseChoices")
  actions:
    killPic: (uri) ->
      @get("model.dataUris")?.removeObject uri
    batch: ->
      @atomically =>
        validate @get 'model'
        .then (model) ->
          model.save()
        .catch (errors) =>
          @set "batchErrors", errors
        .then (model) =>
          @transitionToRoute "docks.batch", model.get("id")

`export default DocksTruckBatchesNewController`
