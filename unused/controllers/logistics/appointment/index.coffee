`import Ember from 'ember'`

LogisticsAppointmentIndexController = Ember.Controller.extend
  queryParams: ["showprob"]
  showprob: null
  prepare: (problem) ->
    archtype: "problem"
    note: Ember.get(problem, "notes")
    title: "A problem has occured with appointment number #{@get 'model.permalink'}"
    permalink: @get("model.id")
    permatype: "appointment"
    createdAt: new Date()
  resolveProblem: ->
    archtype: "problem resolved"
    note: "the problem has been marked as resolved, control of this appointment will now return to me (the computer)."
    title: "The problem with appointment no. #{@get('model.permalink')} has been resolved"
    permalink: @get("model.id")
    permatype: "appointment"
    createdAt: new Date()

  actions:
    cancel: ->
      @get("model").cancel()
      @get("model").save()

    uncancel: ->
      @get("model").uncancel()
      @get("model").save()

    problem: ->
      @set "showprob", true

    unproblem: ->
      @set "showprob", null

    submitProblem: (problem) ->
      @get("model").explode()
      @get("model").save()
      @store.createRecord("message", @prepare problem).save()

    resolveProblem: ->
      @get("model").unexplode()
      @get("model").save()
      @store.createRecord("message", @resolveProblem()).save()

`export default LogisticsAppointmentIndexController`
