`import Ember from 'ember'`

StationsRoute = Ember.Route.extend
  model: ->
    @store.findAll "tile"
    .then (tiles) ->
      tiles.filterBy "tileType", "scale"

`export default StationsRoute`
