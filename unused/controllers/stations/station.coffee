`import Ember from 'ember'`

StationsStationController = Ember.Controller.extend
  station: Ember.computed.alias("model")

`export default StationsStationController`
