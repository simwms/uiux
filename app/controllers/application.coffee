`import Ember from 'ember'`
`import ENV from 'uiux/config/environment'`

{Controller, computed: {alias}} = Ember

ApplicationController = Controller.extend
  queryParams: ["userToken", "accountToken"]
  userToken: null
  accountToken: null
  lines: alias "model.lines"
  tiles: alias "model.tiles"

  actions:
    submit: ->
      @currentUser.clearErrors()
      @currentUser.smartLogin
        email: @get "model.email"
        password: @get "model.password"
        accountToken: @get "model.accountToken"
      .then =>
        @send "refresh" if @currentUser.get("accountLoggedIn")
      

`export default ApplicationController`
