MeshbluVerifierController = require './controllers/meshblu-verifier-controller'

class Router
  constructor: ({@meshbluVerifierService}) ->
  route: (app) =>
    meshbluVerifierController = new MeshbluVerifierController {@meshbluVerifierService}

    app.get '/verifiers/coap', meshbluVerifierController.verifyCoap
    app.get '/verifiers/http', meshbluVerifierController.verifyHttp
    app.get '/verifiers/mqtt', meshbluVerifierController.verifyMqtt
    app.get '/verifiers/socket.io', meshbluVerifierController.verifySocketIO
    app.get '/verifiers/websocket', meshbluVerifierController.verifyWebsocket

module.exports = Router
