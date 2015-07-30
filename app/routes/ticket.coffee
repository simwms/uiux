`import Ember from 'ember'`

TicketRoute = Ember.Route.extend
  afterModel: (model) ->
    $('#game').remove()
  model: (ticket_id: id) ->
    @store.find "weighticket", id

`export default TicketRoute`
