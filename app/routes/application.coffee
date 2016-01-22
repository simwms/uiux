`import Ember from 'ember'`

{Route, isPresent} = Ember

ApplicationRoute = Route.extend
  queryParams:
    rememberToken:
      refreshModel: true
  model: (params) ->
    if params?.rememberToken?
      @session.login(params)
    else
      @session.get("self")
    

`export default ApplicationRoute`

