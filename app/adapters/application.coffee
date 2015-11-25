`import ENV from 'uiux/config/environment'`
`import ActiveModelAdapter from 'active-model-adapter'`
`import Ember from 'ember'`
`import {SimwmsHeaders} from 'simwms-shared'`

ApplicationAdapter = ActiveModelAdapter.extend SimwmsHeaders,
  namespace: ENV.apizNamespace
  host: ENV.host

`export default ApplicationAdapter`