###global define###

define ['services/services'], (services) ->
	'use strict'

	service = ($resource) ->
		$resource './scripts/data/people.json', {},
			query:
				method: 'GET'
				isArray: true

	services.factory 'myService', ['$resource', service]

	service