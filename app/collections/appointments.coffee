`import Ember from 'ember'`
`import { startOfWorkday, finishOfWorkday } from 'uiux/utils/punch-card'`
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

processMacro = (params) ->
  {macro} = params
  switch macro
    when "all-dropoffs"
      params["fulfilled_at"] = true
      params["dropoff"] = true
      params["both"] = true
    when "all"
      params["everything"] = true
    when "fulfilled"
      params["fulfilled_at"] = true
    when "future"
      params["expected_at_start"] = finishOfWorkday().format()
    when "today"
      params["expected_at_start"] = startOfWorkday().format()
      params["expected_at_finish"] = finishOfWorkday().format()
    else "do nothing"
  delete params["macro"]
  params

AppointmentsCollection.processMacro = processMacro
AppointmentsCollection.typeChoices = typeChoices

`export default AppointmentsCollection`
`export {
  AppointmentsCollection,
  processMacro,
  typeChoices
}`