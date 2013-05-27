nextId = 0

people = [
	{"id": "#{nextId++}", "name": "Saasha", "age": "6"}
	{"id": "#{nextId++}", "name": "Planet", "age": "8"}
]

isUniqueName = (name) ->
	(name for person in people when person.name is name).length is 0

module.exports = (app, options) ->
	app.get '/', (req, res) ->
		res.render "#{options.base}/index.html"

	app.get '/people', (req, res) ->
		res.json people

	app.post '/people', (req, res) ->
		name = req.body.name
		age = req.body.age

		message =
			"title": "Duplicate!"
			"message": "#{name} is a duplicate.  Please enter a new name."

		return res.send(message, 403) if not isUniqueName name

		person =
			"id": "#{nextId++}"
			"name": "#{name}"
			"age": "#{age}"

		people.push person
		res.json person

	app.get '/people/:id', (req, res) ->
		id = req.params.id
		current = person for person in people when parseInt(person.id, 10) is parseInt(id, 10)

		res.json current