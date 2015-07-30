`import Ember from 'ember'`
`import AtomicMixin from 'uiux/mixins/atomic'`

StationsTruckDepartureController = Ember.Controller.extend AtomicMixin,
  truck: Ember.computed.alias "model"
  actions:
    weighTruck: ->      
      @transitionToRoute "stations.truck.complete", @get "truck.id"

    exitTruck: ->
      @transitionToRoute "stations.truck.exit", @get "truck.id"

`export default StationsTruckDepartureController`
