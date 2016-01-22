`import Ember from 'ember'`

ManagerAppointmentsNewRoute = Ember.Route.extend
  model: ->
    @store.findAll "company"
    .then (companies) =>
      @store.createRecord "appointment", {companies}

  tearDown: Ember.on "deactivate", ->
    model = @controller.get "model"
    model.deleteRecord() if Ember.get(model, "hasDirtyAttributes")

  actions:
    submit: (appointment) ->
      appointment.save()
      .then ({id}) =>
        @transitionTo "manager.appointment", id

`export default ManagerAppointmentsNewRoute`