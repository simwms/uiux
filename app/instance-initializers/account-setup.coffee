initialize = (instance) ->
  account = instance.container.lookup("session:account")
  store = instance.container.lookup("service:store")
  account.setup store

AccountSetupInitializer =
  name: "account-setup"
  initialize: initialize

`export {initialize}`
`export default AccountSetupInitializer`