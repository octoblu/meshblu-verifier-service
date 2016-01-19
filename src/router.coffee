MeshbluVerifierController = require './controllers/meshblu-verifier-controller'

class Router
  constructor: ({@meshbluVerifierService}) ->
  route: (app) =>
    meshbluVerifierController = new MeshbluVerifierController {@meshbluVerifierService}

    app.get '/hello', meshbluVerifierController.hello
    # e.g. app.put '/resource/:id', someController.update

module.exports = Router
