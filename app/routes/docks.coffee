`import Ember from 'ember'`

DocksRoute = Ember.Route.extend
  model: ->
    @store.findAll "tile"
    .filterBy "tileType", "barn"

`export default DocksRoute`
