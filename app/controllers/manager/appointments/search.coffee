`import Em from 'ember'`

Controller = Em.Controller.extend
  queryParams: ["offset", "limit", "macro"]
  offset: 0
  limit: 25
  macro: "future"

`export default Controller`