`import Ember from 'ember'`

StationsWeighticketRoute = Ember.Route.extend
  model: (weighticketId: id) ->
    @store.find "weighticket", id

`export default StationsWeighticketRoute`
