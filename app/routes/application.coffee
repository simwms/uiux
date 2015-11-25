`import Ember from 'ember'`

{RSVP, computed, Route, get, $} = Ember
{alias} = computed

ApplicationRoute = Route.extend
  queryParams:
    userToken:
      refreshModel: true
    accountToken:
      refreshModel: true

  model: (params) ->
    {accountToken} = params
    @currentUser.smartLogin(params)
    .then =>
      if @currentUser.get("accountLoggedIn")
        RSVP.hash 
          lines: @store.find "line"
          tiles: @store.find "tile"
          points: RSVP.resolve []
      else
        Object.create $.extend({}, {accountToken}, errors: @currentUser.get("errors"))
        
  actions:
    refresh: ->
      @refresh()

`export default ApplicationRoute`

