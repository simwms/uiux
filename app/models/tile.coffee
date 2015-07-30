`import Ember from 'ember'`
`import DS from 'ember-data'`
`import CPM from 'ember-cpm'`
`import D from '../utils/debug-ex'`
`import BatchesCollection from '../collections/batches'`
`import TrucksCollection from '../collections/trucks'`
Macros = CPM.Macros

Alphabet = "abcdefghijklmnopqrstuvwxyz"
AlphabetGr = "αβγδεζηθικλμνξοπρστυφχψω"
AlphabetExt = Alphabet + AlphabetGr

Tile = DS.Model.extend
  tileType: DS.attr "string"
  tileName: DS.attr "string"
  x: DS.attr "number"
  y: DS.attr "number"
  z: DS.attr "number"
  width: DS.attr "number", defaultValue: 1
  height: DS.attr "number", defaultValue: 1
  createdAt: DS.attr "date"
  updatedAt: DS.attr "date"
  cameras: DS.hasMany "camera", async: false
  enteringTrucks: DS.hasMany "truck", inverse: "entryScale", async: false
  exitingTrucks: DS.hasMany "truck", inverse: "exitScale", async: false
  loadingTrucks: DS.hasMany "truck", inverse: "dock", async: false
  batches: DS.hasMany "batch", inverse: "warehouse", async: false

  colName: Ember.computed "x", ->
    x = @getWithDefault "x", 0
    return Alphabet.charAt(x) if x is 0
    output = if x < 0 then "-" else ""
    x = Math.abs x
    until x is 0
      r = x % Alphabet.length
      x = Math.floor(x / Alphabet.length)
      output += Alphabet.charAt r
    output
    
  rowName: Ember.computed.alias "y"

  hasCamera: Ember.computed.gt "cameras.length", 0

  defaultName: Macros.join "colName", "rowName", "-"
  nameOrId: Macros.firstPresent "tileName", "defaultName", "id"
  canonicalName: Ember.computed "tileType", ->
    switch @get "tileType"
      when "barn", "dock" then "loading dock"
      when "warehouse", "storage" then "storage cell"
      when "road" then "road"
      when "station", "scale" then "weight station"
      else "unknown"
  fullTitle: Macros.join "canonicalName", "nameOrId", ":"
  isFree: Ember.computed.equal "status", "free"
  
  status: Ember.computed.alias "trucksCollection.status"

  batchCount: Ember.computed.alias "batches.length"

  batchesCollection: Ember.computed "batches", -> BatchesCollection.fromBatches @get "batches"

  trucksCollection: Ember.computed "enteringTrucks", "exitingTrucks", "loadingTrucks", ->
    TrucksCollection.fromTile
      enter: @get("enteringTrucks")
      exit: @get("exitingTrucks")
      load: @get("loadingTrucks")
`export default Tile`