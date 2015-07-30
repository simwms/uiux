`import Ember from 'ember'`

MessageTruckHasLeftSiteController = Ember.Controller.extend
  actions:
    resolveMessage: ->
      @model.destroyRecord().then => @send 'closeModal'

`export default MessageTruckHasLeftSiteController`
