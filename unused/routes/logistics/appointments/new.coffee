`import Ember from 'ember'`
`import moment from 'moment'`

LogisticsAppointmentsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord "appointment",
      expectedAt: moment()

  tearDown: Ember.on "deactivate", ->
    model = @controller.get "model"
    model.deleteRecord() if Ember.get(model, "hasDirtyAttributes")

`export default LogisticsAppointmentsNewRoute`
