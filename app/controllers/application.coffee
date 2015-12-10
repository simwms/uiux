`import Ember from 'ember'`
{Controller} = Ember

ApplicationController = Controller.extend
  queryParams: ["userToken", "accountToken"]
  userToken: null
  accountToken: null

`export default ApplicationController`
