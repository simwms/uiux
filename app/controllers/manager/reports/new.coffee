`import Em from 'ember'`
`import ENV from 'uiux/config/environment'`
ManagerReportsNewController = Em.Controller.extend
  report: Em.computed.alias "model"
  reportLink: Ember.computed "report.startAt", "report.finishAt", ->
    query =
      start_at: @get("report.startAt")
      finish_at: @get("report.finishAt")
    url = [ENV.printHost, ENV.printNamespace, "reports"]
    .filter Em.isPresent
    .join("/")
    "#{url}?#{Ember.$.param query}"

`export default ManagerReportsNewController`