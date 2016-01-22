`import Ember from 'ember'`

NewRoute = Ember.Route.extend
  model: ->
    @store.createRecord "company"

  tearDown: Ember.on "deactivate", ->
    model = @controller.get "model"
    model.deleteRecord() if Ember.get(model, "hasDirtyAttributes")

  actions:
    submit: (company) ->
      newAppt = @modelFor "manager.appointments.new"
      company.save()
      .then (company) =>
        @transitionTo "manager.appointments.new"

`export default NewRoute`