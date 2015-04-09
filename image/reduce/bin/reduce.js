#!/usr/bin/env node
var http = require('http');
http.createServer(function (req, res) {
  req.pipe(res);
}).listen(80, '0.0.0.0');
