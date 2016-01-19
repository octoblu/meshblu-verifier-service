class MeshbluVerifController
  constructor: ({@meshbluVerifService}) ->

  hello: (request, response) =>
    {hasError} = request.query
    @meshbluVerifService.doHello {hasError}, (error) =>
      return response.status(error.code || 500).send(error: error.message) if error?
      response.sendStatus(200)

module.exports = MeshbluVerifController
