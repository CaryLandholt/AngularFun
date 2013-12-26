class PersonService
	constructor: (@$log, @$http) ->

	get: ->
		@$http.get('/people')
		.then (results) ->
			results.data

	getPerson: (id) ->
		@$http.get("/people/#{id}")
		.then (results) ->
			results.data

	save: (person) ->
		@$http.post('/people', person)
		.error (results, status) ->
			{results, status}

angular.module('app').service 'personService', ['$log', '$http', PersonService]