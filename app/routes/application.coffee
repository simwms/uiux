`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend 
  isBusy: Ember.computed.alias "controllerPen.isBusy"
  isPending: Ember.computed.alias "isBusy"

  model: ->
    @store.findAll "tile"
  actions:
    controllerWorking: (controller) ->
      @controllerPen.makeBusy controller

    controllerFinished: (controller) ->
      @controllerPen.makeFree controller

    openModal: (modalName, model) ->
      if model?
        id = Ember.get(model, "id")
        id ||= model
        @transitionTo modalName, id
      else
        @transitionTo modalName
    closeModal: ->
      @transitionTo "manager"

`export default ApplicationRoute`
