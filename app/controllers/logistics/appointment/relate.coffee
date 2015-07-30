`import Ember from 'ember'`
`import AtomicMixin from 'uiux/mixins/atomic'`

LogisticsAppointmentRelateController = Ember.Controller.extend AtomicMixin,
  pickup: Ember.computed.alias "model.pickup"
  appointmentRelationships: Ember.computed.alias "model.appointmentRelationships.relationCores"
  queryParams: ["search"]
  search: null
  searchBuffer: null

  getAnnoyed: ->
    Ember
    .$ "#annoyed-flash"
    .removeClass "hidden"
    .show()
    .hide(1250)
  
  actions:
    search: ->
      @send "refresh"

`export default LogisticsAppointmentRelateController`
