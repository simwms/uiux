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
id = (x) -> x.id

barns = [2..12].map (k) -> (x: -2, y: k, status: "okay")
  .concat [6..11].map (k) -> (x: 2, y: k, status: "okay")
  .map indexifyIdentity
roads = [1..12].map (k) -> (x: 0, y: k, z: -0.25)
  .concat [1..8].map (k) -> (x: k, y: 12, z: -0.25)
  .concat [1..12].map (k) -> (x: 8, y: k, z: -0.25)
  .map indexifyIdentity
warehouses = product([3..6], [4..11]).map ([x,y]) ->  x: x, y: y
  .concat [2..12].map (k) -> (x: -3, y: k)
  .map indexifyIdentity

stations = [(x: -1, y: 0), (x: 7, y: 0)].map indexifyIdentity
scales = [(x: 0, y: 0), (x: 8, y: 0)].map indexifyIdentity
grid =
  id: 1
  barns: barns.map id
  roads: roads.map id
  warehouses: warehouses.map id
  scales: scales.map id
  stations: stations.map id

router.get '/', (req, res) ->
  res.send 
    grids: [grid]
    barns: barns
    roads: roads
    warehouses: warehouses
    scales: scales
    stations: stations
router.post '/', (req, res) ->
  res.status(201).end()
router.get '/:id', (req, res) ->
  res.send 
    grid: grid
    barns: barns
    roads: roads
    warehouses: warehouses
    scales: scales
    stations: stations
router.put '/:id', (req, res) ->
  res.send 
    grid: grid
    barns: barns
    roads: roads
    warehouses: warehouses
    scales: scales
    stations: stations
router.delete '/:id', (req, res) ->
  res.status(204).end()

module.exports = (app) ->
  app.use '/api/grids', router