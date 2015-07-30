`import DS from 'ember-data'`
`import CPM from 'ember-cpm'`

AppointmentRelationship = DS.Model.extend
  pickup: DS.belongsTo "appointment"
  dropoff: DS.belongsTo "appointment"
  createdAt: DS.attr "moment"
  updatedAt: DS.attr "moment"

  self: Ember.computed -> @
  permaindex: CPM.Macros.join "dropoff.id", "pickup.id", "-"

`export default AppointmentRelationship`