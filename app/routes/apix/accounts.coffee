`import Ember from 'ember'`

ApixAccountsRoute = Ember.Route.extend
  model: ->
    @modelFor "apix"
    .get "accounts"
  actions:
    activate: (account) ->
      @session.update {account}
      .then =>
        @transitionTo "apiz"

`export default ApixAccountsRoute`
