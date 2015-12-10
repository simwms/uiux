`import Ember from 'ember'`

{Route, Object} = Ember
IndexRoute = Route.extend
  beforeModel: ->
    if @currentUser.get("accountLoggedIn")
      @transitionTo "apiz"
    else if @currentUser.get("isLoggedIn")
      @transitionTo "apix"

  actions:
    login: ->
      @currentUser.login()
      .finally =>
        @refresh()

`export default IndexRoute`