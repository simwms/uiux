`import Ember from 'ember'`

markTile = (x) -> 
  x.set "tileType", x.constructor.modelName
  x
markLine = (x) -> 
  x.set "lineType", x.constructor.modelName
  x

{RSVP, Route, isBlank} = Ember
ApizRoute = Route.extend
  beforeModel: ->
    unless @session.get("loggedIn")
      return @transitionTo "index"
    @session
    .get("model")
    .get("account")
    .catch =>
      @transitionTo "apix" if isBlank id

  afterModel: ->
    @session.connect "account"

  findTiles: (type) ->
    @store
    .findAll type
    .then (tiles) ->
      tiles.map markTile
  findLines: (type) ->
    @store
    .findAll type
    .then (tiles) ->
      tiles.map markLine
  model: ->
    RSVP.hash
      scales: @findTiles "scale"
      desks: @findTiles "desk"
      docks: @findTiles "dock"
      gates: @findTiles "gate"
      cells: @findTiles "cell"
      roads: @findLines "road"
      walls: @findLines "wall"

  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/apiz",
      outlet: "sidenav"
      into: "apiz"

  actions:
    query: (tile) ->
      id = tile.get "id"
      switch tile.get("tileType")
        when "cell"
          @transitionTo "manager.inventories.cell", id
        when "dock"
          @transitionTo "manager.dock", id
        when "scale"
          @transitionTo "manager.station", id
        when "desk"
          @transitionTo "manager.appointments"
          
    logout: ->
      @session.logout()
      .then =>
        document.loaction.reload()

`export default ApizRoute`
