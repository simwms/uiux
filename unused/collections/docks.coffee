`import Ember from 'ember'`

DocksCollection = Ember.ArrayProxy.extend
  docks: Ember.computed.alias("content")
  availableDocks: Ember.computed.filterBy "docks", "status", "free"
  firstAvailableDock: Ember.computed.alias "availableDocks.firstPresent"
  dockChoices: Ember.computed.map "docks", (dock) ->
    value: dock
    presentation: [dock.get("nameOrId"), dock.get("status")].join(": ")

DocksCollection.fromTiles = (recordArray) ->
  DocksCollection.create content: recordArray.filterBy("tileType", "barn")

`export default DocksCollection`