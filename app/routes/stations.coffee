`import Ember from 'ember'`

StationsRoute = Ember.Route.extend
  model: ->
    @store.findAll "tile"
    .filterBy "tileType", "scale"

`export default StationsRoute`
