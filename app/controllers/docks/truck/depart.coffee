`import Ember from 'ember'`
`import AtomicMixin from 'uiux/mixins/atomic'`

DocksTruckDepartController = Ember.Controller.extend AtomicMixin,
  truck: Ember.computed.alias "model"
  stationChoices: Ember.computed.alias "model.stations.stationChoices"
  actions:
    finish: ->
      @atomically =>
        truck = @get("truck")
        truck.set "undockedAt", moment()
        truck.save()
        .then (truck) =>
          @transitionToRoute "docks.dock.index", truck.get("dock.id")

`export default DocksTruckDepartController`
