#!/usr/bin/env node

var express = require('express')
var PortJack = express()
var path = require("path");
var HOST = process.env.HOST;

PortJack.get(/^(.+)$/, function(req, res) {

    res.setHeader('Location', 'http://' + HOST + ':5984/apps/_design/bell/MyApp/index.html')
    res.statusCode = 302
    res.end()
})

PortJack.listen(80)