`import Ember from 'ember'`

StationsWeighticketRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "weighticket", id

`export default StationsWeighticketRoute`
