`import Ember from 'ember'`
`import NewRoute from 'uiux/mixins/new-route'`
`import _ from 'lodash/lodash'`

{tap, partialRight: p} = _
Route = Ember.Route.extend NewRoute,
  model: ->
    tap @_super(), p(Ember.set, "appointments", @modelFor("manager").appointments)
  actions:
    create: (truck) ->
      truck.save()
      .then ({id})=>
        @transitionTo "manager.trucks.truck", id

`export default Route`