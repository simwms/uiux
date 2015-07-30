`import Ember from 'ember'`
`import FunctionalValidation from 'ember-functional-validation'`

ensurePersistence = (model) ->
  store = model.store
  appointment = Ember.get model, "appointment"
  return if Ember.isPresent appointment
  "no appointment found"

batchValidator = FunctionalValidation.create
  appointment:
    presence: true
    custom: ensurePersistence

`export default batchValidator`