###global define###

define ['services/services'], (services) ->
	'use strict'

	services.factory 'peopleService', ['$resource', ($resource) ->
		$resource './people', {},
			query:
				method: 'GET'
				isArray: true
	]