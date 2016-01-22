`import Ember from 'ember'`
`import FunEx from 'uiux/utils/fun-ex'`

MessageMiscellaniousController = Ember.Controller.extend
  modalName: FunEx.computed "model.permatype", ->
    switch @get("model.permatype")
      when "live/barn" then "barn"
      when "live/station" then "scale"
      when "truck" then "truck"
      when "live/warehouse" then "warehouse"
      else throw new Error("I don't know how to handle #{@get 'model.permatype'}")
  actions:
    resolveMessage: ->
      @model.destroyRecord().then => @send 'closeModal'


`export default MessageMiscellaniousController`
