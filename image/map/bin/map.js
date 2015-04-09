#!/usr/bin/env node
var http = require('http');
http.createServer(function (req, res) {
  var len = 0;
  req.on('data', function (chunk) {
    len += chunk.length;
  });
  req.on('end', function () {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('' + len);
  });
}).listen(80, '0.0.0.0');
