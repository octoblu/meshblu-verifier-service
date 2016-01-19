CoapVerifier      = require 'meshblu-verifier-coap'
HttpVerifier      = require 'meshblu-verifier-http'
MqttVerifier      = require 'meshblu-verifier-mqtt'
SocketIOVerifier  = require 'meshblu-verifier-socket.io'
WebsocketVerifier = require 'meshblu-verifier-websocket'

class MeshbluVerifierService
  verifyCoap: ({meshbluConfig}, callback) =>
    meshbluConfig.server = 'coap.octoblu.com'
    meshbluConfig.port = 5683
    meshbluConfig.protocol = 'coap'
    verifier = new CoapVerifier {meshbluConfig}
    verifier.verify callback

  verifyHttp: ({meshbluConfig}, callback) =>
    verifier = new HttpVerifier {meshbluConfig}
    verifier.verify callback

  verifyMqtt: ({meshbluConfig}, callback) =>
    meshbluConfig.port = 1883
    verifier = new MqttVerifier {meshbluConfig}
    verifier.verify callback

  verifySocketIO: ({meshbluConfig}, callback) =>
    verifier = new SocketIOVerifier {meshbluConfig}
    verifier.verify callback

  verifyWebsocket: ({meshbluConfig}, callback) =>
    verifier = new WebsocketVerifier {meshbluConfig}
    verifier.verify callback

  _createError: (code, message) =>
    error = new Error message
    error.code = code if code?
    return error

module.exports = MeshbluVerifierService
