###global require, __dirname, process###

((express, dir, port = 3005) ->
	people = [
		{"name": "Cary"}
		{"name": "Saasha"}
		{"name": "Planet"}
	]

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

		app.use express.bodyParser()
		app.use express.static(dir)
		app.use app.router

		app.register '.html',
			compile: (str, options) ->
				(locals) ->
					str

		app.get '/', (req, res) ->
			res.render "#{dir}/index.html"

		app.get '/members', (req, res) ->
			res.json people

		app.post '/members', (req, res) ->
			person = req.body
			people.push person
			#res.json people
			res.send 'Conflictola', 409

		app.listen port, ->
			console.log "Express server listening on port #{app.address().port} in #{app.settings.env} mode"
			open()
)(require('express'), __dirname, process.argv.splice(2)[0])