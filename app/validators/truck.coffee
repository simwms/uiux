`import Ember from 'ember'`
`import FunctionalValidation from 'ember-functional-validation'`

promiseLift = (maybePromise) ->
  return maybePromise if maybePromise? and maybePromise.then? and typeof maybePromise.then is "function"
  new Ember.RSVP.Promise (resolve) -> resolve maybePromise

ensurePersistence = (model, attribute) ->
  promiseLift Ember.get(model, attribute)
  .then (maybeModel) ->
    return "Your #{attribute} does not exist" unless maybeModel?
  .catch (errors) ->
    return "Your #{attribute} could not be found:\n  #{JSON.stringify errors}"

ensureWeighticket = (model) -> ensurePersistence model, "weighticket"
ensureOrigin = (model) -> ensurePersistence model, "origin"
ensureDestiny = (model) -> ensurePersistence model, "destiny"

truckValidator = FunctionalValidation.create
  status:
    presence: true
  arrivedAt:
    presence: true
  origination:
    presence: true
  origintype:
    presence: true
  destination:
    presence: true
  destinytype:
    presence: true
  weighticketId:
    presence: true
  weighticket:
    custom: ensureWeighticket
  origin:
    custom: ensureOrigin
  destiny:
    custom: ensureDestiny

`export default truckValidator`