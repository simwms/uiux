`import Ember from 'ember'`

LogisticsRoute = Ember.Route.extend
  actions:
    exitRole: ->
      @transitionTo "index"

`export default LogisticsRoute`
