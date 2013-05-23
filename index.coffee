dgram = require 'dgram'
helpers = require 'helpers'

exports.send = send = (stream,value) ->
    message = new Buffer JSON.stringify { stream: stream, value: value }
    client = dgram.createSocket "udp4"
    client.send message, 0, message.length, 41234, "localhost", (err, bytes) -> client.close()

exports.watch = (name, frequency, f) ->
    watcher = -> send name, f()
    setInterval watcher, frequency


                