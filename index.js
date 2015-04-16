var express = require('express');
var app = express();
var data = require('./message');

app.get('/', function (req, res) {
    res.send('<p id="hello">'+data.getMessage()+'</p>');
});

var server = app.listen(3000, function () {
    var port = server.address().port;
    console.log('Example app listening on port:', port);
});
