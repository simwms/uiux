`import Ember from 'ember'`
`import FunEx from 'uiux/utils/fun-ex'`

followingOrders = (orders, hash, f) ->
  o1 = orders.map (order) -> hash[order] || [{}]
  reduce o1, [], (xs, ys) -> xs.concat ys

reduce = (xs, init, f) -> xs.reduce f, init

zipWith = ([x, xs...], [y, ys...], f) ->
  return [] unless x?
  [f(x,y)].concat zipWith(xs, ys, f)

class DoubleHash
  constructor: ->
    @dbRow = {}
  insertAt: (krow, kcol, payload) ->
    @dbRow[krow] ||= {}
    @dbRow[krow][kcol] ||= payload
  inOrderOf: (rowNames, colNames) ->
    followingOrders(rowNames, @dbRow)
    .map (rows) -> followingOrders(colNames, rows)

InventoryTableComponent = Ember.Component.extend
  tableClassNames: "table"
  classNames: ['inventory-table-container']
  rowNames: [1..6]
  colNames: "abcde".split("")

  bodyRows: FunEx.computed "colNames.@each", "rowNames.@each", "goods.@each.rowName", "goods.@each.colName", ->
    return unless @get("goods.firstObject.rowName")? and @get("goods.firstObject.colName")?
    dubs = reduce @get("goods"), new DoubleHash(), (dh, good) ->
      dh.insertAt good.get("rowName"), good.get("colName"), good
      dh
    
    rows = dubs.inOrderOf @get("rowNames"), @get("colNames")
    zipWith @get("rowNames"), rows, (name, row) -> Ember.Object.create rowName: name, cells: row


  actions:
    cellTouch: (cell) ->
      @sendAction "action", cell


`export default InventoryTableComponent`
