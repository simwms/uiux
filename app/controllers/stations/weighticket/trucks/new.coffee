`import Ember from 'ember'`
`import validate from 'uiux/validators/truck'`
`import AtomicMixin from 'uiux/mixins/atomic'`


StationsWeighticketTrucksNewController = Ember.Controller.extend AtomicMixin,
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
