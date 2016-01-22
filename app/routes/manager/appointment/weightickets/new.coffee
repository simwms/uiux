`import Ember from 'ember'`
`import NewRoute from 'uiux/mixins/new-route'`
`import _ from 'lodash/lodash'`

{tap, partialRight: p} = _
Route = Ember.Route.extend NewRoute,
  model: ->
    tap @_super(arguments...), p(Ember.set, "appointment", @modelFor("manager.appointment"))
  actions:
    create: (weighticket) ->
      weighticket.save()
      .then (weighticket)=>
        @transitionTo "manager.weighticket", weighticket

`export default Route`