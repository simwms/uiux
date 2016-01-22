`import Ember from 'ember'`
`import config from 'uiux/config/environment'`
`import EmberCPM from 'ember-cpm'`
StationsWeighticketPrintController = Ember.Controller.extend
  weighticket: Ember.computed.alias "model"
  printTicketLink: EmberCPM.Macros.fmt "weighticket.id", "#{config.print}/weightickets/%@"

`export default StationsWeighticketPrintController`
