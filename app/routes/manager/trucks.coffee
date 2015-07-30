`import Ember from 'ember'`

ManagerTrucksRoute = Ember.Route.extend
  model: ->
    @modelFor "manager"
    .trucks

`export default ManagerTrucksRoute`
