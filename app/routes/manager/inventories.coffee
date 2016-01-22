`import Ember from 'ember'`

ManagerInventoriesRoute = Ember.Route.extend
  model: ->
    @store.findAll "cell"

`export default ManagerInventoriesRoute`
