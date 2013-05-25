dgram = require 'dgram'
helpers = require 'helpers'
decorators = require 'decorators'

exports.send = send = (msg) ->
    message = new Buffer JSON.stringify msg
    client = dgram.createSocket "udp4"
    client.send message, 0, message.length, 41234, "localhost", (err, bytes) -> client.close()

exports.watch = (graph, source, frequency, f) ->
    watcher = -> send { graph: graph, source: source, push: f() }
    setInterval watcher, frequency

exports.change = change = (graph,source,change) ->
    send graph: graph, source: source, change: change
    