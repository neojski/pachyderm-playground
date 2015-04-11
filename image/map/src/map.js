#!/usr/bin/env node
var http = require('http');
http.createServer(function (req, res) {
  var len = 0;
  req.on('data', function (chunk) {
    len += chunk.length;
  });
  req.on('end', function () {
    res.end('' + len + '\n');
  });
}).listen(80, '0.0.0.0');
