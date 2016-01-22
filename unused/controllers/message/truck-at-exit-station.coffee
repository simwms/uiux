`import Ember from 'ember'`

MessageTruckAtExitStationController = Ember.Controller.extend
  actions:
    resolveMessage: ->
      @model.destroyRecord().then => @send 'closeModal'

`export default MessageTruckAtExitStationController`
