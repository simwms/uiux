`import ControllerPen from 'uiux/utils/controller-pen'`

# Takes two parameters: container and app
initialize = (registry, application) ->
  application.register "pen:controllers", ControllerPen
  application.inject "route:application", "controllerPen", "pen:controllers"

ControllerPenInitializer =
  name: 'controller-pen'
  initialize: initialize

`export {initialize}`
`export default ControllerPenInitializer`
