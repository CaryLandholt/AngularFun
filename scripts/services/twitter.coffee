###global define###

define ['services/services', 'services/message'], (services) ->
	'use strict'

	services.factory 'twitter', ['$resource', 'message', ($resource, message) ->
		tweets = result: {}

		activity = $resource 'http://search.twitter.com/search.json',
			callback: 'JSON_CALLBACK',
				get:
					method: 'JSONP'

		get = (criteria, success, failure) ->
			tweets.result = activity.get q: criteria, ->
				message.publish 'search', source: 'Twitter', criteria: criteria

				success.apply(this, arguments) if angular.isFunction success
			, failure

		get: get
		tweets: tweets
	]