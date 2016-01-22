`import Ember from 'ember'`
{isPresent, inject} = Ember
ApixRoute = Ember.Route.extend
  socket: inject.service("socket")
  beforeModel: ->
    @transitionTo "index" unless @session.get("loggedIn")
  model: ->
    @session
    .get("model")
    .get("user")
  afterModel: (user) ->
    @session.connect("user")

`export default ApixRoute`
