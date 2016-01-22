`import Ember from 'ember'`
`import StationsCollection from 'uiux/collections/stations'`

calculateWarehousePreference = (batches) ->
  batches.get("lastObject.warehouse")

calculateExitScalePreference = (stations) ->
  stations.get("firstObject")

DocksTruckRoute = Ember.Route.extend
  model: ({id}) ->
    Ember.RSVP.hash
      tiles: @store.findAll "tile"
      batches: @store.find("batch", truck: id)
      truck: @store.find("truck", id)
    .then ({truck, batches, tiles}) ->
      stations = StationsCollection.fromTiles(tiles)
      truck.set "stations", stations
      truck.set "exitScale", calculateExitScalePreference(stations)
      truck.set "preferredWarehouse", calculateWarehousePreference(batches)  
      truck.set "batches", batches
      truck

    
`export default DocksTruckRoute`
