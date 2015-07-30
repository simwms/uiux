`import DS from 'ember-data'`

ApplicationAdapter = DS.ActiveModelAdapter.extend # PhoenixChan,
  namespace: "apiv2"
  socketNamespace: "apiv2"
  socketHost: "ws://localhost:4000"

  shouldReloadAll: -> true
  shouldBackgroundReloadRecord: -> true

`export default ApplicationAdapter`