`import Ember from 'ember'`
`import FunctionalValidation from 'ember-functional-validation'`

ensureRealAppointment = (model) ->
  store = model.store  
  return if (appointment = model.get("appointment"))?
  "the appointment number: #{appno} doesn't exist"

ensureFreeDock = (model) ->
  store = model.store
  dock = model.get "dock"
  return "the dock number: #{dock.get 'nameOrId'} doesn't exist" unless dock?
  return "the dock number: #{dock.get 'nameOrId'} is not free, please select another dock" unless dock.get("isFree")
    

weighticketValidator = FunctionalValidation.create
  appointment:
    presence: true
    custom: ensureRealAppointment
  pounds: 
    presence: true
  licensePlate: 
    presence: true
  dock: 
    presence: true
    custom: ensureFreeDock

`export default weighticketValidator`