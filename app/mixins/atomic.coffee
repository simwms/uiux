`import Ember from 'ember'`

isPromiseLike = (maybePromise) ->
  maybePromise? and typeof maybePromise.then is 'function'

notProMsg = (notPromise) -> """
Whatever action you give to the atomically method should return a promise,
this promise should resolve after you've finished whatever calculation you were doing.
However, through some oversight your part, you actually gave me #{notPromise},
which is not a promise.
"""

assertThenable = (maybePromise) ->
  throw new Error notProMsg(maybePromise) unless isPromiseLike maybePromise
  maybePromise

AtomicMixin = Ember.Mixin.create
  isPending: Ember.computed.or "model.isPending", "model.isSaving", "isBusy"
  atomically: (action) ->
    return if @get "isBusy"
    Ember.run =>
      @send "controllerWorking", @
      @set "isBusy", true
      assertThenable action()
      .finally =>
        @set "isBusy", false
        @send "controllerFinished", @

`export default AtomicMixin`