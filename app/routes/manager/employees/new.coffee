`import Ember from 'ember'`
`import Tiles from 'uiux/collections/tiles'`

ManagerEmployeesNewRoute = Ember.Route.extend
  model: ->
    @store.findAll "tile"
    .then Tiles.fromTiles
    .then (tiles) =>
      @store.createRecord "employee",
        tiles: tiles

  tearDown: Ember.on "deactivate", ->
    model = @controller.get "model"
    model.deleteRecord() if Ember.get(model, "hasDirtyAttributes")

`export default ManagerEmployeesNewRoute`