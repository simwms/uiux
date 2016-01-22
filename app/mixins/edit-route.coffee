`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

{endsWith, partialRight: p} = _
parentName = p(trimEnd, ".edit")
inferParentName = (routeName) ->
  return parentName(routeName) if endsWith(routeName, ".edit")
  throw new Error """
  Your route name: '#{routeName}' should follow the convention of 'blah.model-name.edit'
  """

RouteMixin = Ember.Mixin.create
  tearDown: Ember.on "deactivate", ->
    model = @controller.get "model"
    model.rollbackAttributes() if Ember.get(model, "hasDirtyAttributes")

  actions:
    update: (model) ->
      model
      .save()
      .then (model) =>
        @transitionTo inferParentName(@get("routeName")), model

`export default RouteMixin`