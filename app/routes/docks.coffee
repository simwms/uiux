`import Ember from 'ember'`

DocksRoute = Ember.Route.extend
  model: ->
    @modelFor "application"
    .filterBy "tileType", "barn"

`export default DocksRoute`
