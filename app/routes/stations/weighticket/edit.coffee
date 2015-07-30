`import Ember from 'ember'`
`import Docks from 'uiux/collections/docks'`

StationsWeighticketEditRoute = Ember.Route.extend
  model: ->
    tiles = @modelFor("application")
    weighticket = @modelFor "stations.weighticket"
    weighticket.set "docks", Docks.fromTiles(tiles)
    weighticket

`export default StationsWeighticketEditRoute`
