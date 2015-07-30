`import Ember from 'ember'`

MessagesRoute = Ember.Route.extend
  model: ->
    @store.find "message"

`export default MessagesRoute`
