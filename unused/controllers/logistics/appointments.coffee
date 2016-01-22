`import Ember from 'ember'`
`import {withinWorkingHours} from 'uiux/utils/punch-card'`

LogisticsAppointmentsController = Ember.Controller.extend
  queryParams:[
    "macro"
  ]
  macro: "all"
  pageBinding: "model.page"
  perPageBinding: "model.perPage"
  totalPagesBinding: "model.totalPages"

  withinWorkingHours: Ember.computed "clock.rightNow", ->
    withinWorkingHours moment @get "clock.rightNow"


`export default LogisticsAppointmentsController`
