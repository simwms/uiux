Session = Ember.ObjectProxy.extend
  setup: (store) ->
    store.find "account", 1
    .then (account) =>
      @set "content", account
    
initialize = (registry, application) ->
  application.register "session:account", Session
  application.inject "controller", "currentAccount", "session:account"
  application.inject "route", "currentAccount", "session:account"

AccountSetupInitializer =
  name: "account-setup"
  initialize: initialize

`export {initialize}`
`export default AccountSetupInitializer`