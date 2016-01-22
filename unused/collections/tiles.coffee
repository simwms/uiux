`import Ember from 'ember'`

rejectBy = (arrayKey, attrKey, value) ->
  Ember.computed "#{arrayKey}.@each.#{attrKey}", ->
    @get arrayKey
    .rejectBy attrKey, value

TilesCollection = Ember.ArrayProxy.extend
  tiles: Ember.computed.alias "content"
  workableTiles: rejectBy "content", "tileType", "road"
  employeeTiles: rejectBy "workableTiles", "tileType", "warehouse"
  employeeChoices: Ember.computed.map "employeeTiles", (tile) ->
    value: tile
    presentation: tile.get("fullTitle")
  workableChoices: Ember.computed.map "workableTiles", (tile) ->
    value: tile
    presentation: tile.get("fullTitle")

TilesCollection.fromTiles = (tiles) ->
  TilesCollection.create content: tiles

`export default TilesCollection`