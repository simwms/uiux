`import ENV from 'uiux/config/environment'`
`import ActiveModelAdapter from 'active-model-adapter'`
`import Ember from 'ember'`
`import {SimwmsHeaders} from 'simwms-shared'`

ApplicationAdapter = ActiveModelAdapter.extend SimwmsHeaders,
  namespace: ENV.apiaNamespace
  host: ENV.host

`export default ApplicationAdapter`