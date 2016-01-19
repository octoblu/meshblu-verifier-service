class MeshbluVerifierController
  constructor: ({@meshbluVerifierService}) ->

  hello: (request, response) =>
    {hasError} = request.query
    @meshbluVerifierService.doHello {hasError}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.sendStatus(200)

module.exports = MeshbluVerifierController
