var http = require('http')
var exec = require('child_process').exec
var fs = require('fs')

var ip = require('ip');
var webhookHandler = require('github-webhook-handler')
var handler = webhookHandler({ path: '/webhook', secret: 'secret' })

console.log('Starting Github webhook: http://' + ip.address() + ':8888/webhook')

http.createServer(function (req, res) {
    handler(req, res, function (err) {
        res.statusCode = 404
    })
}).listen(8888)

handler.on('error', function (err) {
    console.error(err.message)
})

handler.on('push', function (push) {
    console.log(push.payload.head_commit.url);
    exec('./deploy.sh', function (error, stdout, stderr) {
        console.log(stdout)
        console.log(stderr)
    });
})