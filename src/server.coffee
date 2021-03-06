cors               = require 'cors'
morgan             = require 'morgan'
express            = require 'express'
bodyParser         = require 'body-parser'
errorHandler       = require 'errorhandler'
meshbluHealthcheck = require 'express-meshblu-healthcheck'
meshbluAuth        = require 'express-meshblu-auth'
MeshbluConfig      = require 'meshblu-config'
debug              = require('debug')('meshblu-verifier-service:server')
Router             = require './router'
MeshbluVerifierService = require './services/meshblu-verifier-service'

class Server
  constructor: ({@disableLogging, @port}, {@meshbluConfig})->
    @meshbluConfig ?= new MeshbluConfig().toJSON()

  address: =>
    @server.address()

  run: (callback) =>
    app = express()
    app.use meshbluHealthcheck()
    app.use morgan 'dev', immediate: false unless @disableLogging
    app.use cors()
    app.use errorHandler()
    app.use meshbluAuth(@meshbluConfig)
    app.use bodyParser.urlencoded limit: '1mb', extended : true
    app.use bodyParser.json limit : '1mb'

    app.options '*', cors()

    meshbluVerifierService = new MeshbluVerifierService
    router = new Router {@meshbluConfig, meshbluVerifierService}

    router.route app

    @server = app.listen @port, callback

  stop: (callback) =>
    @server.close callback

module.exports = Server
