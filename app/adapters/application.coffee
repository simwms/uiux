`import DS from 'ember-data'`
`import ENV from 'uiux/config/environment'`
`import ActiveModelAdapter from 'active-model-adapter'`

alias = Ember.computed.alias

ApplicationAdapter = ActiveModelAdapter.extend # PhoenixChan,
  namespace: alias "currentUser.namespace"
  host: alias "currentUser.host"

  shouldReloadAll: -> true
  shouldBackgroundReloadRecord: -> true

`export default ApplicationAdapter`