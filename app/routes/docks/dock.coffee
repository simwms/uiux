`import Ember from 'ember'`

DocksDockRoute = Ember.Route.extend
  model: ({id}) ->
    @store.find "tile", id
  actions:
    exitRole: ->
      @transitionTo "index"

`export default DocksDockRoute`
