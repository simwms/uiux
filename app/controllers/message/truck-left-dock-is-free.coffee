`import Ember from 'ember'`

MessageTruckLeftDockIsFreeController = Ember.Controller.extend
  actions:
    resolveMessage: ->
      @model.destroyRecord().then => @send 'closeModal'

`export default MessageTruckLeftDockIsFreeController`
