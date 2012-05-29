###global require, __dirname, process###

((express, dir, port = 3005) ->
	nextId = 0

	people = [
		{"id": "#{nextId++}", "name": "Cary"}
		{"id": "#{nextId++}", "name": "Saasha"}
		{"id": "#{nextId++}", "name": "Planet"}
	]

	isUniqueName = (name) ->
		(name for person in people when person.name is name).length is 0

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

		app.get '/people', (req, res) ->
			res.json people

		app.post '/people', (req, res) ->
			name = req.body.name

			#&quot;{{name}}&quot; is a duplicate.  Please enter a new name.

			message =
				"title": "Duplicate!"
				"message": "#{name} is a duplicate.  Please enter a new name."

			return res.send(message, 403) if not isUniqueName name

			person =
				"id": "#{nextId++}"
				"name": "#{name}"

			people.push person
			res.json person

			#res.header('Authenticated', 'NOPE')
			#res.send 'Conflictola', 401

		app.listen port, ->
			console.log "Express server listening on port #{app.address().port} in #{app.settings.env} mode"
			open()
)(require('express'), __dirname, process.argv.splice(2)[0])