class PersonService
	constructor: ($log, $http) ->
		urlBase = '/people'

		PersonService::get = ->
			$http.get(urlBase)
			.then (results) ->
				results.data

		PersonService::getPerson = (id) ->
			$http.get("#{urlBase}/#{id}")
			.then (results) ->
				results.data

		PersonService::save = (person) ->
			$http.post("#{urlBase}", person)
			.error (results, status) ->
				{results, status}

angular.module('app').service 'personService', ['$log', '$http', PersonService]