`import Ember from 'ember'`

StationsRoute = Ember.Route.extend
  model: ->
    @modelFor "application"
    .filterBy "tileType", "scale"

`export default StationsRoute`
