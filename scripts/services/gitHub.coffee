###global define###

define ['libs/angular', 'services/services', 'services/message'], (angular, services) ->
	'use strict'

	services.factory 'gitHub', ['$resource', 'message', ($resource, message) ->
		repos = result: {}

		activity = $resource 'https://github.com/api/v2/json/repos/show/:user',
			callback: 'JSON_CALLBACK',
				get:
					method: 'JSONP'

		get = (criteria, success, failure) ->
			repos.result = activity.get user: criteria
			, (Resource, getResponseHeaders) ->
				message.publish 'search', source: 'GitHub', criteria: criteria

				success.apply(this, arguments) if angular.isFunction success
			, failure

		get: get
		repos: repos
	]