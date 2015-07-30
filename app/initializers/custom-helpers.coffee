`import { num } from '../helpers/num'`
`import { registerHelper } from 'ember-truth-helpers/utils/register-helper'`

# Takes two parameters: container and app
initialize = ->
  registerHelper "num", num

CustomHelpersInitializer =
  name: 'custom-helpers'
  initialize: initialize

`export {initialize}`
`export default CustomHelpersInitializer`
