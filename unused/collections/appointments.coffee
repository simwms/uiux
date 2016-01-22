`import Ember from 'ember'`
`import {QueryUtils} from 'autox'`

typeChoices = Ember.A []
typeChoices.pushObject
  value: "dropoff"
  presentation: "drop off"
typeChoices.pushObject
  value: "pickup"
  presentation: "pick up"
typeChoices.pushObject
  value: "both"
  presentation: "both"

AppointmentsCollection = Ember.ArrayProxy.extend
  appointments: Ember.computed.filterBy "content", "id"

AppointmentsCollection.fromAppointments = (appointments) ->
  AppointmentsCollection.create content: appointments

AppointmentsCollection.processMacro = processMacro
AppointmentsCollection.typeChoices = typeChoices

`export default AppointmentsCollection`
`export {
  AppointmentsCollection,
  processMacro,
  typeChoices
}`