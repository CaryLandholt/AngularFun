express = require 'express'
routes = require './routes'
dir = "#{__dirname}/dist"
port = process.env.PORT ? process.argv.splice(2)[0] ? 3005

# Create express facility.
app = express()
# Create a HTTP server object.
server = require('http').createServer(app)
# Create SocketIO binding.
io = require('socket.io').listen(server)

app.configure ->
	# use livereload middleware
	app.use require('grunt-contrib-livereload/lib/utils').livereloadSnippet
	app.use express.logger 'dev'
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.errorHandler()
	app.use express.static dir
	app.use app.router
	routes app, dir

module.exports = server

# Override: Provide an "use" used by grunt-express.
module.exports.use = -> app.use.apply app, arguments