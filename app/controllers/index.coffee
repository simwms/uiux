`import Ember from 'ember'`
`import ENV from 'uiux/config/environment'`

{Controller} = Ember

IndexController = Controller.extend
  actions:
    logout: ->
      @currentUser.logout()
      .then =>
        unless @currentUser.get("accountLoggedIn")
          @currentUser.accountLogout()
          @send "refresh" 

`export default IndexController`