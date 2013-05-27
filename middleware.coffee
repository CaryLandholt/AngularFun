module.exports = (connect, options) ->
	express = require 'express'
	app = express()

	app.configure ->
		app.use require('grunt-contrib-livereload/lib/utils').livereloadSnippet
		app.use express.logger 'dev'
		app.use express.bodyParser()
		app.use express.methodOverride()
		app.use express.errorHandler()
		app.use express.static options.base
		app.use app.router
		require('./routes')(app, options)

	connect(app).stack