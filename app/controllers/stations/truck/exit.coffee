`import Ember from 'ember'`
`import CPM from 'ember-cpm'`
`import AtomicMixin from 'uiux/mixins/atomic'`
`import config from 'uiux/config/environment'`

StationsTruckExitController = Ember.Controller.extend AtomicMixin,
  truck: Ember.computed.alias "model"
  printTicketLink: CPM.Macros.fmt "truck.weighticketId", "#{config.print}/weightickets/%@"

`export default StationsTruckExitController`
