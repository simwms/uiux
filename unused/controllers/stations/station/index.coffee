`import Ember from 'ember'`

StationsStationIndexController = Ember.Controller.extend
  appointments: Ember.computed.alias("model.appointments")
  station: Ember.computed.alias("model.station")
  trucks: Ember.computed.alias("station.exitingTrucks")

  actions:
    depart: (truck) ->
      truck.set "exitScale", @get("station")
      truck.save()
      .then =>
        @transitionToRoute "stations.truck.departure", truck.get("id")


`export default StationsStationIndexController`
