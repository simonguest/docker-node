var express = require('express');
var app = express();
var phantom = require('phantom');

app.get('/pdf', function (req, res) {
    console.log(req.query.host);
    console.log(req.query.port);
    phantom.create(function (ph) {
        ph.createPage(function (page) {
            page.open('http://'+req.query.host+':'+req.query.port, function (status) {
                console.log(status);
                page.set('paperSize', {
                    format: 'Legal',
                    orientation: 'landscape'
                }, function () {
                    page.render(__dirname + '/tmp/report.pdf', function () {
                        res.sendFile(__dirname + '/tmp/report.pdf');
                        ph.exit();
                    });
                });
            });
        });
    });
});

app.get('/', function (req, res) {
    res.send('<p style="font-family:Ubuntu Condensed">Hello World - value is: ' + process.env.SIMON + '</p>');
});

var server = app.listen(3000, function () {

    var host = server.address().address;
    var port = server.address().port;

    console.log('Example app listening at http://%s:%s', host, port);

});
