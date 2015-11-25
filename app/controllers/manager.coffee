`import Ember from 'ember'`
`import momentFormat from 'ember-moment/computeds/format'`

ManagerController = Ember.Controller.extend
  tiles: Ember.computed.alias "model.tiles"
  trucks: Ember.computed.alias "model.trucks"
  batches: Ember.computed.alias "model.batches"
  appointments: Ember.computed.alias "model.appointments"
  rightNow: momentFormat("clock.rightNow", "MM/DD/YY - h:mm a")

  actions:
    clickTile: (tile) ->
      switch tile.get "tileType"
        when "dock", "barn"
          @transitionToRoute "manager.dock", tile.get "id"
        when "warehouse"
          @transitionToRoute "manager.inventories.cell", tile.get "id"
        when "station", "scale"
          @transitionToRoute "manager.station", tile.get "id"
        else
          @transitionToRoute "manager.trucks"
  
`export default ManagerController`
