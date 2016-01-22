`import Ember from 'ember'`
`import validate from 'uiux/validators/weighticket'`

StationsWeighticketEditController = Ember.Controller.extend
  dockChoices: Ember.computed.alias "model.docks.dockChoices"

  actions:
    newTicket: ->
      validate @get "model"
      .then (weighticket) ->
        weighticket.save()
      .then (weighticket) =>
        @transitionToRoute "stations.weighticket.print", weighticket.get("id")
      .catch (errors) =>
        @set "mistakes", errors

`export default StationsWeighticketEditController`
