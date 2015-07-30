express = require 'express'
router = express.Router()
scales = []
scales.push id: 0, x: 0, y: 0
scales.push id: 1, x: 8, y: 0

findById = (xs, id) -> xs[id]

router.get '/', (req, res) ->
  res.send scales: scales

router.post '/', (req, res) ->
  res.status(201).end()

router.get '/:id', (req, res) ->
  res.send scale: findById(scales, req.params.id)

router.put '/:id', (req, res) ->
  res.send scale: findById(scales, req.params.id)

router.delete '/:id', (req, res) ->
  res.status(204).end()

module.exports = (app) ->
  app.use '/api/scales', router