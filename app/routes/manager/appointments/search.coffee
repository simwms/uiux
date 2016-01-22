`import Ember from 'ember'`
`import {processQuery} from 'uiux/utils/process-query'`

Route = Ember.Route.extend
  queryParams:
    offset:
      refreshModel: true
    limit:
      refreshModel: true
    macro:
      refreshModel: true
  model: (params) ->
    @store.query "appointment", processQuery(params)

`export default Route`