`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route "apix"
  @route "apiz", path: "/apiz", ->
    @route "logistics", path: "/logistics", resetNamespace: true, ->
      @route "pictures", path: "/pictures", ->
      @route "inventories", path: "/inventories", ->
        @route "batch", path: "/batch/:id", ->
        @route "cell", path: "/cell/:id", ->
          @route "pictures"
      
      @route "appointments", path: "/appointments", ->
        @route "new"

      @route "appointment", path: "/appointment/:id", ->
        @route "edit"
        @route "reschedule"

        @route "relate", path: "/relate", ->
          @route "appointment", path: "/appointment/:id", ->
    
    @route "stations", path: "/stations", resetNamespace: true, ->
      @route "weighticket", path: "/weighticket/:id", ->
        @route "edit"
        @route "print"
        @route "trucks", path: "/trucks", ->
          @route "new"
      @route "station", path: "/station/:id", ->
        @route "weightickets", path: "/weightickets", ->
          @route "new"
        @route "status"
        @route "problem"
      @route "truck", path: "/truck/:id", ->
        @route "departure"
        @route "complete"
        @route "exit"

    @route "docks", path: "/docks", resetNamespace: true, ->
      @route "batch", path: "/batch/:id", ->
      @route "inventories", path: "/inventories", ->
        @route "cell", path: "/cell/:id", ->
          @route "pictures"
      @route "dock", path: "/dock/:id", ->
        @route "status"
        @route "problem"
      @route "truck", path: "/truck/:id", ->
        @route "arrive"
        @route "batches", path: "/batches", ->
          @route "new"
        @route "depart"
        

    @route "manager", path: "/manager", resetNamespace: true, ->    
      @route "dock", path: "/dock/:id", ->
      @route "station", path: "/station/:id", ->
      @route "inventories", path: "/inventories", ->
        @route "cell", path: "/cell/:id", ->
        @route "batch", path: "/batch/:id", ->
      @route "trucks", path: "/trucks", ->
        @route "truck", path: "/truck/:id", ->
      @route "appointments", path: "/appointments", ->
      @route "cameras", path: "/cameras", ->
        @route "camera", path: "/camera/:id", ->
        @route "overview"
      @route "employees", path: "/employees", ->
        @route "new"
      @route "settings", path: "/settings", ->
        @route "debug"
        @route "workflows"
      @route "reports", path: "/reports", ->
        @route "new"


`export default Router`