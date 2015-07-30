`import Ember from 'ember'`
`import ApplicationAdapter from './application'`
`import ENV from 'uiux/config/environment'`

AccountAdapter = ApplicationAdapter.extend
  namespace: ENV.simwmsNamespace
  host: ENV.simwmsHost

`export default AccountAdapter`