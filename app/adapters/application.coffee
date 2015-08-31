`import DS from 'ember-data'`
`import ENV from 'uiux/config/environment'`
`import ActiveModelAdapter from 'active-model-adapter'`

volatile = ->
  Ember.computed(arguments...).volatile()

ApplicationAdapter = DS.ActiveModelAdapter.extend # PhoenixChan,
  namespace: ENV.namespace
  host: ENV.host
  headers: volatile "currentUser.simwmsAccountSession", ->
    "simwms-account-session": @get("currentUser.simwmsAccountSession")

  shouldReloadAll: -> true
  shouldBackgroundReloadRecord: -> true

`export default ApplicationAdapter`