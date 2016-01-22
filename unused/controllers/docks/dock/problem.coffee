`import Ember from 'ember'`

DocksDockProblemController = Ember.Controller.extend
  prepare: (params) ->
    archtype: "problem"
    note: Ember.get(params, "notes")
    title: "A problem has occured at loading dock no. #{@get('model.dockNumber')}"
    permalink: @get("model.id")
    permatype: @get("model.constructor.typeKey")
    createdAt: new Date()
  actions:
    newProblemMessage: (params) ->
      dock = @get("model")
      dock.createProblem @prepare params
      .then =>
        @transitionToRoute "docks.dock.status", @get("model.id")

`export default DocksDockProblemController`
