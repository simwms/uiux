`import DS from 'ember-data'`
`import ENV from 'uiux/config/environment'`

ApplicationAdapter = DS.ActiveModelAdapter.extend # PhoenixChan,
  namespace: ENV.namespace
  host: ENV.host

  shouldReloadAll: -> true
  shouldBackgroundReloadRecord: -> true

`export default ApplicationAdapter`