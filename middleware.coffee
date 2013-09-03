module.exports = (connect, options) ->
	express = require 'express'
	middlewares = []

	options.base.forEach (base) ->
		routes = require './routes'
		app = express()

		app.configure ->
			app.use express.logger 'dev'
			app.use express.bodyParser()
			app.use express.methodOverride()
			app.use express.errorHandler()
			app.use express.static base
			app.use app.router
			routes app, options

		middlewares.push connect(app)

	middlewares