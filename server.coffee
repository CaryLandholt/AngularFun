###global require, __dirname, process###

((express, dir, port = 3005) ->
	app = express.createServer()

	open = (command = 'open') ->
		url = "http://localhost:#{app.address().port}"
		ostype = require('os').type()
		command = 'explorer' if ostype is 'Windows_NT'
		spawn = require('child_process').spawn

		console.log "launching #{url}" 

		spawn command, [url]

	app.configure ->
		app.set 'view options',
			layout: false

		app.use express.static(dir)
		app.use app.router

		app.register '.html',
			compile: (str, options) ->
				(locals) ->
					str

		app.get '/', (req, res) ->
			res.render "#{dir}/index.html"

		app.listen port, ->
			console.log "Express server listening on port #{app.address().port} in #{app.settings.env} mode"
			open()
)(require('express'), __dirname, process.argv.splice(2)[0])