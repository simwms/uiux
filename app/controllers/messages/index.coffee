`import Ember from 'ember'`

MessagesIndexController = Ember.Controller.extend
  actions:
    killMessage: (message) ->
      message.destroyRecord()

`export default MessagesIndexController`
