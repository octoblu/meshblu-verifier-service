class MeshbluVerifierController
  constructor: ({@meshbluVerifierService}) ->

  verifyCoap: (request, response) =>
    meshbluConfig = request.meshbluAuth
    @meshbluVerifierService.verifyCoap {meshbluConfig}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.sendStatus(204)

  verifyHttp: (request, response) =>
    meshbluConfig = request.meshbluAuth
    @meshbluVerifierService.verifyHttp {meshbluConfig}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.sendStatus(204)

  verifyMqtt: (request, response) =>
    meshbluConfig = request.meshbluAuth
    @meshbluVerifierService.verifyMqtt {meshbluConfig}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.sendStatus(204)

  verifySocketIO: (request, response) =>
    meshbluConfig = request.meshbluAuth
    @meshbluVerifierService.verifySocketIO {meshbluConfig}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.sendStatus(204)

  verifyWebsocket: (request, response) =>
    meshbluConfig = request.meshbluAuth
    @meshbluVerifierService.verifyWebsocket {meshbluConfig}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.sendStatus(204)

module.exports = MeshbluVerifierController
