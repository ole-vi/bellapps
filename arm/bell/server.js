#!/usr/bin/env node

var express = require('express')
var PortJack = express()
var path = require("path");

PortJack.get(/^(.+)$/, function(req, res) {
    var options = {
        "127.0.0.1": "http://127.0.0.1:2200/apps/_design/bell/MyApp/index.html",
        "localhost": "http://localhost:2200/apps/_design/bell/MyApp/index.html"
    }

    if (options.hasOwnProperty(req.hostname)) {
        res.setHeader('Location', options[req.hostname])
    } else {
        res.setHeader('Location', 'http://docker.ole.org:2200/apps/_design/bell/MyApp/index.html')
    }

    res.statusCode = 302
    res.end()
})

PortJack.listen(80)