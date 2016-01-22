`import Ember from 'ember'`

ManagerReportsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord "report",
      startAt: moment().startOf("week")
      finishAt: moment()

  tearDown: Ember.on "deactivate", ->
    model = @controller.get "model"
    model.deleteRecord()

`export default ManagerReportsNewRoute`