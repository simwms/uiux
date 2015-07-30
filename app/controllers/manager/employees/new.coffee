`import Em from 'ember'`

ManagerEmployeesNewController = Em.Controller.extend
  tileChoices: Em.computed.alias "model.tiles.employeeChoices"
  employee: Em.computed.alias "model"
  actions:
    create: ->
      @get "model"
      .save()
      .then =>
        @transitionToRoute "manager.employees.index"
      .catch (error) =>
        @set "employeeErrors", error
        console.log error


`export default ManagerEmployeesNewController`