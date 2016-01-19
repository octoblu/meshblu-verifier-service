MeshbluVerifController = require './controllers/meshblu-verif-controller'

class Router
  constructor: ({@meshbluVerifService}) ->
  route: (app) =>
    meshbluVerifController = new MeshbluVerifController {@meshbluVerifService}

    app.get '/hello', meshbluVerifController.hello
    # e.g. app.put '/resource/:id', someController.update

module.exports = Router
