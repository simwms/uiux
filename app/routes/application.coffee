`import Ember from 'ember'`

{Route, isPresent} = Ember

ApplicationRoute = Route.extend
  queryParams:
    userToken:
      refreshModel: true
    accountToken:
      refreshModel: true

  model: (params) ->
    @currentUser.smartLogin(params)
    .finally => @currentUser

    
`export default ApplicationRoute`

