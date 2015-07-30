`import Ember from 'ember'`

StationsCollection = Ember.ArrayProxy.extend
  stations: Ember.computed.alias("content")

  stationChoices: Ember.computed.map "stations", (station) ->
    value: station
    presentation: station.get("nameOrId")

StationsCollection.fromTiles = (recordArray) ->
  StationsCollection.create content: recordArray.filterBy("tileType", "scale")

`export default StationsCollection`