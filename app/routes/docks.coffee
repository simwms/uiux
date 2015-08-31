`import Ember from 'ember'`

DocksRoute = Ember.Route.extend
  model: ->
    @store.findAll "tile"
    .then (tiles) ->
      tiles.filterBy "tileType", "barn"

`export default DocksRoute`
