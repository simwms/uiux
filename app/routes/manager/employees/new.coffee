`import Ember from 'ember'`

ManagerEmployeesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord "employee"

  tearDown: Ember.on "deactivate", ->
    model = @controller.get "model"
    model.deleteRecord() if Ember.get(model, "hasDirtyAttributes")

`export default ManagerEmployeesNewRoute`