`import Ember from 'ember'`
{computed: {alias}} = Ember
ApizController = Ember.Controller.extend
  scales: alias "model.scales"
  desks: alias "model.desks"
  docks: alias "model.docks"
  gates: alias "model.gates"
  cells: alias "model.cells"
  roads: alias "model.roads"
  walls: alias "model.walls"

`export default ApizController`
