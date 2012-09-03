express = require 'express'
routes = require './routes'
dir = "#{__dirname}/dist"
port = process.argv.splice(2)[0] ? 3005
app = express()

app.configure ->
	app.set 'view options',
		layout: false

	app.use express.bodyParser()
	app.use express.static dir
	app.use app.router

	app.engine '.html', (str, options) ->
		(locals) ->
			str

routes app

app.listen port, ->
	console.log "starting web server at http://localhost:#{port}"