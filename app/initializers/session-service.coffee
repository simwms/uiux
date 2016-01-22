# Takes two parameters: container and application
initialize = (application) ->
  application.inject "route", "session", "service:session"
  application.inject "controller", "session", "service:session"
  application.inject "component", "session", "service:session"

SessionServiceInitializer =
  name: 'session-service'
  initialize: initialize

`export {initialize}`
`export default SessionServiceInitializer`
