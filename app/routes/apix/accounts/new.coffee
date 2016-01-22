`import Ember from 'ember'`

ApixAccountsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord "account"

  actions:
    submit: (account) ->
      account
      .save()
      .then (account) =>
        @send "activate", account

`export default ApixAccountsNewRoute`