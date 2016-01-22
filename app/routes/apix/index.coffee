`import Ember from 'ember'`

ApixIndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo "apix.accounts.index"

`export default ApixIndexRoute`