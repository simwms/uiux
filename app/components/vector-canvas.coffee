`import Ember from 'ember'`
`import CPM from 'ember-cpm'`
assertNumericality = (x) ->
  Ember.assert "Expected a number, instead got #{x}", x <= 0 or x > 0
  x

VectorCanvasComponent = Ember.Component.extend
  classNames: ['vector-canvas']
  attributeBindings: ["width", "height"]
  pxPerWidth: 55
  pxPerHeight: 55

  canvasTransform: CPM.Macros.fmt "translate.x", "translate.y", "translate(%@, %@)"
  init: ->
    @translate = Ember.Object.create x:0, y:0
    @translate.set "x", @canvasThirdWidth()
    @translate.set "y", @canvasQuarterHeight()
    @_super arguments...

  didInsertElement: ->
    d3.select @$('svg')[0]
    .call @makeDragBehavior()

  canvasThirdWidth: ->
    assertNumericality Ember.$(document).width() / 3
    
  canvasQuarterHeight: ->
    assertNumericality Ember.$(document).height() / 3

  makeDragBehavior: ->
    d3.behavior.drag()
    .origin -> 
      x: 0
      y: 0
    .on "drag", =>
      {dx, dy} = d3.event
      @translate.incrementProperty "x", dx / 2
      @translate.incrementProperty "y", dy / 2

`export default VectorCanvasComponent`