`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
  queryParams:
    token:
      refreshModel: true
    account:
      refreshModel: true

  model: (params) ->
    @currentUser.configure(params)
    @currentUser.setup(@store)

  isBusy: Ember.computed.alias "controllerPen.isBusy"
  isPending: Ember.computed.alias "isBusy"

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
