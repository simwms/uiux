`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route "apix", path: "/apix", ->
    @route "employees", path: "/employees"
    @route "accounts", path: "/accounts", ->
      @route "new"
  @route "apiz", path: "/apiz", ->
    @route "manager", path: "/manager", resetNamespace: true, ->
      @route "dock", path: "/dock/:dock_id", ->
      @route "docks", path: "/docks", ->
      @route "inventories", path: "/inventories", ->
        @route "batch", path: "/batch/:batch_id", ->
        @route "cell", path: "/cell/:cell_id", ->
      @route "scales", path: "/scales", ->
      @route "station", path: "/station/:scale_id", ->
      @route "trucks", path: "/trucks", ->
        @route "new"
        @route "truck", path: "/truck/:truck_id", ->
      @route "weighticket", path: "/weighticket/:weighticket_id", ->
        @route "edit"
      @route "appointment", path: "/apppointment/:appointment_id", ->
        @route "edit"
        @route "weightickets", path: "/weightickets", ->
          @route "new"
      @route "appointments", path: "/appointments", ->
        @route "search"
        @route "new", path: "/new", ->
          @route "companies", path: "/companies", ->
            @route "new"
      @route "cameras", path: "/cameras", ->
        @route "camera", path: "/camera/:camera_id", ->
        @route "overview"
      @route "employees", path: "/employees", ->
        @route "new"
      @route "settings", path: "/settings", ->
        @route "debug"
        @route "workflows"
      @route "reports", path: "/reports", ->
        @route "new"


# @route "logistics", path: "/logistics", resetNamespace: true, ->
#   @route "pictures", path: "/pictures", ->
#   @route "inventories", path: "/inventories", ->
#     @route "batch", path: "/batch/:batch_id", ->
#     @route "cell", path: "/cell/:cell_id", ->
#       @route "pictures"
  
#   @route "appointments", path: "/appointments", ->
#     @route "new"

#   @route "appointment", path: "/appointment/:appointment_id", ->
#     @route "edit"
#     @route "reschedule"

#     @route "relate", path: "/relate", ->
#       @route "appointment", path: "/appointment/:appointment_id", ->

# @route "stations", path: "/stations", resetNamespace: true, ->
#   @route "weighticket", path: "/weighticket/:weighticket_id", ->
#     @route "edit"
#     @route "print"
#     @route "trucks", path: "/trucks", ->
#       @route "new"
#   @route "station", path: "/station/:station_id", ->
#     @route "weightickets", path: "/weightickets", ->
#       @route "new"
#     @route "status"
#     @route "problem"
#   @route "truck", path: "/truck/:truck_id", ->
#     @route "departure"
#     @route "complete"
#     @route "exit"

# @route "docks", path: "/docks", resetNamespace: true, ->
#   @route "batch", path: "/batch/:batch_id", ->
#   @route "inventories", path: "/inventories", ->
#     @route "cell", path: "/cell/:cell_id", ->
#       @route "pictures"
#   @route "dock", path: "/dock/:dock_id", ->
#     @route "status"
#     @route "problem"
#   @route "truck", path: "/truck/:truck_id", ->
#     @route "arrive"
#     @route "batches", path: "/batches", ->
#       @route "new"
#     @route "depart"
`export default Router`