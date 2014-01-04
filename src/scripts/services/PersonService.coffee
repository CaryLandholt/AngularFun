class PersonService
	constructor: (@$http) ->

	get: (id) ->
		return if id
			@$http.get("/people/#{id}")
			.then (results) ->
				results.data

		@$http.get('/people')
		.then (results) ->
			results.data

	save: (person) ->
		@$http.post('/people', person)
		.error (results, status) ->
			{results, status}