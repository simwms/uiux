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
  
  afterModel: (model, transition) ->
    return if @currentUser.get("accountLoggedIn")
    @set "originalTransition", transition
    transition.abort()
    @transitionTo "index"
  actions:
    refresh: ->
      if (t = @get "originalTransition")?
        @set "originalTransition", null
        t.retry()
      @refresh()

`export default ApplicationRoute`

