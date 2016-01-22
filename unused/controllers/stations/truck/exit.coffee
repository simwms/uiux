`import Ember from 'ember'`
`import CPM from 'ember-cpm'`
`import {Atomic} from 'simwms-shared'`
`import config from 'uiux/config/environment'`

StationsTruckExitController = Ember.Controller.extend Atomic,
  truck: Ember.computed.alias "model"
  printTicketLink: CPM.Macros.fmt "truck.weighticketId", "#{config.print}/weightickets/%@"

`export default StationsTruckExitController`
