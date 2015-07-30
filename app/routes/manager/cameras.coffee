`import Ember from 'ember'`

ManagerCamerasRoute = Ember.Route.extend
  model: ->
    @store.find "camera"

`export default ManagerCamerasRoute`
