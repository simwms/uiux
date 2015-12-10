`import Ember from 'ember'`
`import validate from 'uiux/validators/truck'`
`import {Atomic} from 'simwms-shared'`


StationsWeighticketTrucksNewController = Ember.Controller.extend Atomic,
  truck: Ember.computed.alias "model"
    
  actions:
    finish: ->
      @atomically =>
        @get("truck").save()
        .then (truck) =>
          entryScaleId = truck.get("entryScale.id")
          Ember.assert "there is a entry scale id #{entryScaleId}", Ember.isPresent entryScaleId
          @transitionToRoute "stations.station", entryScaleId
      
`export default StationsWeighticketTrucksNewController`
