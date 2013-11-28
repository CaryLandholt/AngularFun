class Service
	urlBase = '/people'

	constructor: (@$log, @$http) ->

	get: ->
		@$http.get(urlBase)
		.then (results) ->
			results.data

	getPerson: (id) ->
		@$http.get("#{urlBase}/#{id}")
		.then (results) ->
			results.data

	save: (person) ->
		@$http.post("#{urlBase}", person)
		.error (results, status) ->
			{results, status}

angular.module('app').service 'personService', ['$log', '$http', Service]