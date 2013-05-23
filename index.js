// Generated by CoffeeScript 1.4.0
(function() {
  var dgram, helpers, send;

  dgram = require('dgram');

  helpers = require('helpers');

  exports.send = send = function(stream, value) {
    var client, message;
    message = new Buffer(JSON.stringify({
      stream: stream,
      value: value
    }));
    client = dgram.createSocket("udp4");
    return client.send(message, 0, message.length, 41234, "localhost", function(err, bytes) {
      return client.close();
    });
  };

  exports.watch = function(name, frequency, f) {
    var watcher;
    watcher = function() {
      return send(name, f());
    };
    return setInterval(watcher, frequency);
  };

}).call(this);