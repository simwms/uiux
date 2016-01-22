`import Em from 'ember'`
`import ENV from 'uiux/config/environment'`
{Controller, computed, $, isBlank} = Ember
{alias} = computed
{printHost, printNamespace} = ENV
ManagerReportsNewController = Controller.extend
  report: alias "model"
  startAt: alias "report.startAt"
  finishAt: alias "report.finishAt"
  reportLink: computed "report.id", 
    get: ->
      return if isBlank(id = @get "report.id")
      [printHost, printNamespace, "reports", id].join("/")
  actions:
    submit: ->
      @get "report"
      .save()

`export default ManagerReportsNewController`