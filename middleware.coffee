module.exports = (connect, options) ->
	express = require 'express'
	livereloadUtilities = require 'grunt-contrib-livereload/lib/utils'
	routes = require './routes'
	app = express()

	app.configure ->
		app.use livereloadUtilities.livereloadSnippet
		app.use express.logger 'dev'
		app.use express.bodyParser()
		app.use express.methodOverride()
		app.use express.errorHandler()
		app.use express.static options.base
		app.use app.router
		routes app, options

	connect(app).stack