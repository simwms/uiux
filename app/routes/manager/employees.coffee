`import Ember from 'ember'`

ManagerEmployeesRoute = Ember.Route.extend
  model: ->
    @store.findAll "employee"
    

`export default ManagerEmployeesRoute`