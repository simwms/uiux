`import Ember from 'ember'`

DocksDockIndexController = Ember.Controller.extend
  trucks: Ember.computed.filterBy "model.loadingTrucks", "undockedAt", null

  alreadyDockedTrucks: Ember.computed.filterBy "trucks", "dockedAt"

  comingDockedTrucks: Ember.computed.filterBy "trucks", "dockedAt", null

  problemResolvedMessage: ->
    archtype: "problem resolved"
    note: "the problem has been marked as resolved, control at this dock will now return to me (the comptuer)."
    title: "The problem at dock no. #{@get('model.dockNumber')} has been resolved"
    permalink: @get("model.id")
    permatype: "barn"
    createdAt: new Date()
  actions:
    resolveProblem: ->
      @model.resolveProblem()

    arrive: (truck) ->
      truck.set "dockedAt", moment()
      truck.save()

`export default DocksDockIndexController`
