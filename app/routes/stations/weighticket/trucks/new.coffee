`import Ember from 'ember'`
`import { promiseFilterBy, lll } from 'uiux/utils/prelude'`

get = Ember.get

StationsWeighticketTrucksNewRoute = Ember.Route.extend
  model: ->
    weighticket = @modelFor "stations.weighticket"
    return truck if (truck = weighticket.get("truck"))?
    @newTruckFor weighticket

  newTruckFor: (weighticket) ->
    @store.createRecord "truck",
      arrivedAt: moment()
      entryScale: weighticket.get("issuer")
      dock: weighticket.get("dock")
      appointment: weighticket.get("appointment")
      weighticket: weighticket

`export default StationsWeighticketTrucksNewRoute`
