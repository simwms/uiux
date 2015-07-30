`import Ember from 'ember'`

MessageRoute = Ember.Route.extend
  model: (message_id: id) ->
    @store.find "message", id

  afterModel: (message) ->
    route = ["message", Ember.String.dasherize(message.get("archtype"))].join(".")
    @transitionTo route, message.get("id")

`export default MessageRoute`
