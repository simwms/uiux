`import Em from 'ember'`
`import ENV from 'uiux/config/environment'`
{Controller, computed, $, isPresent} = Ember
{alias} = computed

ManagerReportsNewController = Controller.extend
  report: alias "model"
  startAt: alias "report.startAt"
  finishAt: alias "report.finishAt"
  reportLink: alias "report.link"

  actions:
    submit: ->
      @get "report"
      .save()

`export default ManagerReportsNewController`