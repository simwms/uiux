`import Ember from 'ember'`

{Route, Object} = Ember
IndexRoute = Route.extend
  beforeModel: ->
    if @session.get("loggedIn")
      @transitionTo "apix"

  model: ->
    @session.get "model"

  actions:
    login: ->
      @session.login()
      .finally => @refresh()

`export default IndexRoute`