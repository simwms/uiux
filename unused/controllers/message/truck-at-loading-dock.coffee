`import Ember from 'ember'`

MessageTruckAtLoadingDockController = Ember.Controller.extend
  actions:
    resolveMessage: ->
      @model.destroyRecord().then => @send 'closeModal'

`export default MessageTruckAtLoadingDockController`
