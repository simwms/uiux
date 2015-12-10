`import Ember from 'ember'`
`import {Atomic} from 'simwms-shared'`

StationsTruckDepartureController = Ember.Controller.extend Atomic,
  truck: Ember.computed.alias "model"
  actions:
    weighTruck: ->      
      @transitionToRoute "stations.truck.complete", @get "truck.id"

    exitTruck: ->
      @transitionToRoute "stations.truck.exit", @get "truck.id"

`export default StationsTruckDepartureController`
