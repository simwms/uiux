`import Ember from 'ember'`

ApixEmployeesRoute = Ember.Route.extend
  model: ->
    @modelFor "apix"
    .get "employees"
  actions:
    activate: (employee) ->
      session = @session.get "model"
      session.set "employee", employee
      session.save()
      .then =>
        @transitionTo "apiz"

`export default ApixEmployeesRoute`
