`import Ember from 'ember'`
`import {processMacro} from 'uiux/collections/appointments'`

LogisticsAppointmentsRoute = Ember.Route.extend
  queryParams:
    macro:
      refreshModel: true
    page:
      refreshModel: true
    per:
      refreshModel: true
  macro: "all"

  model: (params) ->
    @store.query "appointment", processMacro params

  actions:
    updateAppointments: ->
      @refresh()
      


`export default LogisticsAppointmentsRoute`
