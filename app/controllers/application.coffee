`import Ember from 'ember'`
`import ENV from 'uiux/config/environment'`
`import AtomicMixin from 'uiux/mixins/atomic'`

ApplicationController = Ember.Controller.extend AtomicMixin,
  queryParams: ["token", "account"]
  token: null
  account: null
  
  simwmsBackPath: ENV.simwmsHomePage
  simwmsHelpPath: ENV.simwmsHelpPage
  actions:
    submit: ->
      @atomically =>
        @get("model")
        .setup @store


`export default ApplicationController`
