`import Ember from 'ember'`

ManagerReportsNewRoute = Ember.Route.extend
  model: ->
    Ember.Object.create
      startAt: moment().startOf("week").format "YYYY-MM-DD"
      finishAt: moment().format "YYYY-MM-DD"

`export default ManagerReportsNewRoute`