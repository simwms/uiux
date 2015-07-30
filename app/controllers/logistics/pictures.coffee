`import Ember from 'ember'`

PicturesController = Ember.Controller.extend
  actions:
    submit: ->
      @get "model"
      .save @store


`export default PicturesController`