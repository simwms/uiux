`import Ember from 'ember'`
`import CPM from 'ember-cpm'`
{run, computed} = Ember
{map} = computed
{Macros: {fmt}} = CPM
AppointmentLinksCollectionComponent = Ember.Component.extend
  classNames: ["appointment-links-collection"]
  attributeBindings: ["style"]
  items: map "appointments", (x) -> x
  collectionHeight: 375
  collectionWidth: 600
  itemWidth: 350
  itemHeight: 45
  style: computed "collectionWidth", "collectionHeight",
    get: -> 
      w = @get "collectionWidth"
      h = @get "collectionHeight"
      ready = @get "boundaryConditionsReady"
      "position:relative;height:#{h}px;" + if ready then "width:#{w}px;" else ""

  didInsertElement: ->
    run.next @, ->
      width = @$().width()
      @set "collectionWidth", width
      @set "itemWidth", width
      @set "boundaryConditionsReady", true
    

`export default AppointmentLinksCollectionComponent`

  