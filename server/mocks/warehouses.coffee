express = require 'express'
router = express.Router()
flatten = ([xs, xss...]) ->
  return [] unless xs?
  xs.concat flatten xss
product = (xs, ys) ->
  flatten xs.map (x) -> ys.map (y) -> [x,y]
indexifyIdentity = (obj, ind) ->
  obj.id = ind
  obj
warehouses = product([3..6], [4..11])
  .map ([x,y]) ->  x: x, y: y
  .concat [2..12].map (k) -> (x: -3, y: k)
  .map indexifyIdentity
first = ([out, _...]) -> out
findById = (xs, id) ->
  first xs.filter (x) -> x.id.toString() is id

router.get '/', (req, res) ->
  res.send warehouses: warehouses

router.post '/', (req, res) ->
  res.status(201).end()

router.get '/:id', (req, res) ->
  res.send warehouse: findById(warehouses, req.params.id.trim())

router.put '/:id', (req, res) ->
  res.send warehouse: findById(warehouses, req.params.id.trim())

router.delete '/:id', (req, res) ->
  res.status(204).end()

module.exports = (app) ->
  app.use '/api/warehouses', router