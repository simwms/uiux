`import DS from 'ember-data'`
`import CPM from 'ember-cpm'`

BatchRelationship = DS.Model.extend
  appointment: DS.belongsTo "appointment"
  batch: DS.belongsTo "batch"
  createdAt: DS.attr "moment"
  updatedAt: DS.attr "moment"

  # This is needed for ember list view
  self: Ember.computed -> @
  permaindex: CPM.Macros.join "appointment.id", "batch.id", "-"

`export default BatchRelationship`