`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

{flow, takeRight, first, endsWith, partialRight: p} = _
split = (str, x) -> String.prototype.split.call(str, x)
modelName = flow p(split, "."), p(takeRight, 2), first, Ember.String.singularize
inferModelName = (routeName) ->
  return modelName(routeName) if endsWith(routeName, ".new")
  throw new Error """
  Your route name: '#{routeName}' should follow the convention of 'blah.model-name.new'
  """

RouteMixin = Ember.Mixin.create
  model: ->
    @store.createRecord inferModelName @get "routeName"
  tearDown: Ember.on "deactivate", ->
    model = @controller.get "model"
    model.deleteRecord() if Ember.get(model, "hasDirtyAttributes")

`export default RouteMixin`