###global define###

define ['responseInterceptors/responseInterceptors', 'statuses'], (responseInterceptors, statuses) ->
	'use strict'

	responseInterceptors.config ['$httpProvider', ($httpProvider) ->
		$httpProvider.responseInterceptors.push ['$rootScope', '$q', ($rootScope, $q) ->
			success = (response) ->
				status = statuses[response.status]

				return response if not status

				$rootScope.$broadcast "success:#{status}", response

				response

			error = (response) ->
				status = statuses[response.status]

				return response if not status

				deferred = $q.defer()

				$rootScope.$broadcast "error:#{status}", response

				deferred.promise

			(promise) ->
				promise.then success, error
		]
	]