###global require, __dirname###

((express, dir) ->
	app = express.createServer()

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

		app.listen 3000, ->
			console.log "Express server listening on port #{app.address().port} in #{app.settings.env} mode"
)(require("express"), __dirname)