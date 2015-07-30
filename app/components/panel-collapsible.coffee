`import Ember from 'ember'`
isBlank = Ember.isBlank
PanelCollapsibleComponent = Ember.Component.extend
  classNames: ["panel", "panel-collapsible"]
  classNameBindings: ["isActive:panel-primary:panel-default"]
  activationKey: "id"
  init: ->
    @_super arguments...
    key = @get "activationKey"
    @isActive = Ember.computed "model.#{key}", "active", ->
      id = @get("model.#{key}")
      return true if isBlank(@get "model") and isBlank(@get "active")
      id is @get("active")

  actions:
    clickHeader: ->
      @sendAction 'action', @get("model")
  

`export default PanelCollapsibleComponent`