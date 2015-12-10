`import Ember from 'ember'`

ApixRoute = Ember.Route.extend
  beforeModel: ->
    unless @currentUser.get("isLoggedIn")
      @transitionTo "index"
  model: ->
    @store.findAll "account"
  actions:
    activate: (account) ->
      @currentUser.accountLogin account
      .then =>
        @transitionTo "apiz"

`export default ApixRoute`
