# Takes two parameters: container and app
initialize = ->
  window.Error.stackTraceLimit = Infinity

ErrorStackInitializer =
  name: 'error-stack'
  initialize: initialize

`export {initialize}`
`export default ErrorStackInitializer`
