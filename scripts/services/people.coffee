###global define###

define ['services/services'], (services) ->
	'use strict'

	services.factory 'people', ['$resource', ($resource) ->
		people = result: []

		activity = $resource './people',
			callback: 'JSON_CALLBACK',
				get:
					method: 'GET'
					isArray: true
				post:
					method: 'POST'

		get = (success, failure) ->
			people.result = activity.get success, failure

		post = (name = "Somebody else", success, failure) ->
			activity.post "name": name
			, (person) ->
				people.result.push person

				success.apply(this, arguments) if angular.isFunction success
			, failure

		get: get
		people: people
		post: post
	]