###global define###

define ['services/services'], (services) ->
	'use strict'

	services.factory 'people', ['$resource', ($resource) ->
		people = result: {}

		activity = $resource './members',
			callback: 'JSON_CALLBACK',
				get:
					method: 'GET'
					isArray: true
				post:
					method: 'POST'
					isArray: true

		get = (success, failure) ->
			people.result = activity.get success, failure

		post = (person = {"name": "Somebody else"}, success, failure) ->
			people.result = activity.post person, success, failure

		get: get
		people: people
		post: post
	]