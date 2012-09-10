express = require 'express'
routes = require './routes'
dir = "#{__dirname}/dist"
port = process.env.PORT ? process.argv.splice(2)[0] ? 3005
app = express()

app.configure ->
	app.use express.logger 'dev'
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.errorHandler()
	app.use express.static dir
	app.use app.router
	routes app, dir

app.listen port, ->
	console.log "started web server at http://localhost:#{port}"