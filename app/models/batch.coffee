`import DS from 'ember-data'`

Batch = DS.Model.extend
  batchType: DS.attr "string", defaultValue: "incoming"
  permalink: DS.attr "string"
  description: DS.attr "string"
  quantity: DS.attr "string"
  deletedAt: DS.attr "moment"
  createdAt: DS.attr "moment"
  updatedAt: DS.attr "moment"
  pickupAppointments: DS.attr "array"

  dock: DS.belongsTo "tile"
  warehouse: DS.belongsTo "tile"
  appointment: DS.belongsTo "appointment", async: true
  truck: DS.belongsTo "truck", async: true

`export default Batch`