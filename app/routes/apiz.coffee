`import Ember from 'ember'`
{RSVP, Route} = Ember
ApizRoute = Route.extend
  beforeModel: ->
    unless @currentUser.get("accountLoggedIn")
      @transitionTo "index"
  model: ->
    RSVP.hash
      lines: @store.findAll "line"
      tiles: @store.findAll "tile"
  
  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/apiz",
      outlet: "sidenav"
      into: "apiz"

  actions:
    query: (tile) ->
      console.log tile
          
    logout: ->
      @currentUser.logout()
      .then =>
        window.Location.reload()

`export default ApizRoute`
