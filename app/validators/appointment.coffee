`import Ember from 'ember'`
`import FunctionalValidation from 'ember-functional-validation'`

get = Ember.get

validateDate = (model) ->
  date = get(model, "expectedAt").toDate()
  return "#{date} is not an instance of Date" unless date instanceof Date
  return "#{date} is not a valid date" if date.toString().match /invalid date/i

appointmentValidator = FunctionalValidation.create
  company:
    presence: true
  materialDescription:
    presence: true
  expectedAt:
    presence: true
    custom: validateDate

`export default appointmentValidator`