`import Ember from 'ember'`

{Route, Object} = Ember
IndexRoute = Route.extend
  renderTemplate: ->
    @_super arguments...
    if @currentUser.get "accountLoggedIn"
      @render "sidenavs/index",
        outlet: "sidenav"

`export default IndexRoute`