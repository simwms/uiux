express = require 'express'
router = express.Router()
indexifyIdentity = (obj, ind) ->
  obj.id = ind
  obj
barns = [2..12].map (k) -> (x: -2, y: k, status: "okay")
  .concat [6..11].map (k) -> (x: 2, y: k, status: "okay")
  .map indexifyIdentity
first = ([out, _...]) -> out
findById = (xs, id) ->
  first xs.filter (x) -> x.id.toString() is id

router.get '/', (req, res) ->
  res.send barns: barns

router.post '/', (req, res) ->
  res.status(201).end()

router.get '/:id', (req, res) ->
  res.send barn: findById(barns, req.params.id.trim())

router.put '/:id', (req, res) ->
  res.send barn: findById(barns, req.params.id.trim())

router.delete '/:id', (req, res) ->
  res.status(204).end()

module.exports = (app) ->
  app.use '/api/barns', router