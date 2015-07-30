`import Ember from 'ember'`
`import PicturesCollection from 'uiux/collections/pictures'`

PicturesRoute = Ember.Route.extend
  model: ->
    PicturesCollection.initialize()

`export default PicturesRoute`