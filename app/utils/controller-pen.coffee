`import Ember from 'ember'`

freeMsg = (ctrl) -> """
You tried to free #{ctrl}, but it was never enslaved in the controller pen in the first place
"""

negMsg = """
You tried to free more controllers than you had, this is likely an oversight on your part
"""

ControllerPen = Ember.Object.extend
  init: ->
    @busyControllers = 0
    @ctrlCenter = new Ember.Map()
  isBusy: Ember.computed.not "isFree"
  isFree: Ember.computed.equal "busyControllers", 0
  makeBusy: (ctrl) ->
    return if @ctrlCenter.get(ctrl) is "busy"
    @ctrlCenter.set ctrl, "busy"
    @incrementProperty "busyControllers", 1

  makeFree: (ctrl) ->
    throw new Error freeMsg(ctrl) unless @ctrlCenter.has ctrl
    return if @ctrlCenter.get(ctrl) is "free"
    @ctrlCenter.set ctrl, "free"
    @decrementProperty "busyControllers", 1
    throw new Error negMsg if @get("busyControllers") < 0

`export default ControllerPen`