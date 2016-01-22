`import Ember from 'ember'`
`import Docks from 'uiux/collections/docks'`

StationsWeighticketEditRoute = Ember.Route.extend
  model: ->
    weighticket = @modelFor "stations.weighticket"
    @store.findAll "tile"
    .then Dock.fromTiles
    .then (docks) ->
      weighticket.set "docks", docks
      weighticket

`export default StationsWeighticketEditRoute`
