`import Ember from 'ember'`

NewsTickerComponent = Ember.Component.extend
  classNames: ["news-ticker"]

  actions:
    openMessage: (message) ->
      alert message

`export default NewsTickerComponent`
