`import Ember from 'ember'`
`import DS from 'ember-data'`

alias = Ember.computed.alias
  
Truck = DS.Model.extend
  arrivedAt: DS.attr "moment"
  dockedAt: DS.attr "moment"
  undockedAt: DS.attr "moment"
  departedAt: DS.attr "moment"

  entryScale: DS.belongsTo "tile"
  exitScale: DS.belongsTo "tile"
  dock: DS.belongsTo "tile"
  appointment: DS.belongsTo "appointment", async: true
  weighticket: DS.belongsTo "weighticket", async: true

  appointmentPermalink: alias "appointment.permalink"

  position: Ember.computed "arrivedAt", "dockedAt", "undockedAt", "departedAt", ->
    return "departed" if @get("departedAt")?.isValid()
    return "going to exit" if @get("undockedAt")?.isValid()
    return "at dock" if @get("dockedAt")?.isValid()
    return "going to dock" if @get("arrivedAt")?.isValid()
    "at entrance"

`export default Truck`
