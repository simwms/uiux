`import Ember from 'ember'`

DocksInventoriesRoute = Ember.Route.extend
  model: ->
    @store.peekAll "tile"


`export default DocksInventoriesRoute`
