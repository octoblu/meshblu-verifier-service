class MeshbluVerifierController
  constructor: ({@meshbluVerifierService}) ->

  verifyCoap: (request, response) =>
    meshbluConfig = request.meshbluAuth
    @meshbluVerifierService.verifyCoap {meshbluConfig}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.status(200).send success: true

  verifyHttp: (request, response) =>
    meshbluConfig = request.meshbluAuth
    @meshbluVerifierService.verifyHttp {meshbluConfig}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.status(200).send success: true

  verifyMqtt: (request, response) =>
    meshbluConfig = request.meshbluAuth
    @meshbluVerifierService.verifyMqtt {meshbluConfig}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.status(200).send success: true

  verifySocketIO: (request, response) =>
    meshbluConfig = request.meshbluAuth
    @meshbluVerifierService.verifySocketIO {meshbluConfig}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.status(200).send success: true

  verifyWebsocket: (request, response) =>
    meshbluConfig = request.meshbluAuth
    @meshbluVerifierService.verifyWebsocket {meshbluConfig}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.status(200).send success: true

module.exports = MeshbluVerifierController
