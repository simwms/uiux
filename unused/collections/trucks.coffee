`import Ember from 'ember'`

rejectBy = (arrayKey, attrKey, value) ->
  Ember.computed "#{arrayKey}.@each.#{attrKey}", ->
    @get arrayKey
    .rejectBy attrKey, value

filterBy = Ember.computed.filterBy

TrucksCollection = Ember.ArrayProxy.extend
  trucks: rejectBy "content", "position", "departed"
  enters: filterBy "rawEnters", "position", "going to dock"
  exits: filterBy "rawExits", "position", "going to exit"
  loads: filterBy "rawLoads", "position", "at dock"
  status: Ember.computed "enters.length", "exits.length", "loads.length", ->
    return "busy" if @get("enters.length") > 0 or @get("loads.length") > 0
    "free"

TrucksCollection.fromTile = ({enter,exit,load}) ->
  trucks = Ember.A([])
  .pushObjects enter
  .pushObjects exit
  .pushObjects load
  TrucksCollection.create
    content: trucks
    rawEnters: enter
    rawExits: exit
    rawLoads: load

TrucksCollection.fromTrucks = (trucks) ->
  TrucksCollection.create content: trucks

`export default TrucksCollection`
