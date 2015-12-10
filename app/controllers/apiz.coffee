`import Ember from 'ember'`
{computed: {alias}} = Ember
ApizController = Ember.Controller.extend
  lines: alias "model.lines"
  tiles: alias "model.tiles"

`export default ApizController`
