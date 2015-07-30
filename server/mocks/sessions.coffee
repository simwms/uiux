express = require 'express'
bodyParser = require 'body-parser'
router = express.Router()

router.use bodyParser.json()
router.use bodyParser.urlencoded extended: true

manager =
  id: 1
  role: "manager"
worker =
  id: 2
  role: "dock worker"
scaler =
  id: 3
  role: "scale master"
sessions = [manager, worker, scaler]
currentSession = null

findByRole = (xs, role) ->
  for x in xs
    if x.role is role
      return x
  return

router.get '/', (req, res) ->
  res.send session: currentSession
router.get '/:id', (req, res) ->
  res.send session: currentSession

router.post '/', (req, res) ->
  role = req.body.session.role.trim()
  currentSession = findByRole(sessions, role)
  res.send session: currentSession

router.delete '/:id', (req, res) ->
  res.status(204).end()

module.exports = (app) ->
  app.use '/api/sessions', router