#!/usr/bin/env node

var byline = require('byline');
var http = require('http');
http.createServer(function (req, res) {
  var total = 0;
  var line_stream = byline(req);
  line_stream.on('data', function (line) {
    total += parseInt(line, 10);
  });
  line_stream.on('end', function () {
    res.end(total + '\n');
  });
}).listen(80, '0.0.0.0');
