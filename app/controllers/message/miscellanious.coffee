`import Ember from 'ember'`

MessageMiscellaniousController = Ember.Controller.extend
  actions:
    resolveMessage: ->
      @model.destroyRecord().then => @send 'closeModal'


`export default MessageMiscellaniousController`
