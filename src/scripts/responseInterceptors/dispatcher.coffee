###global define###

define ['responseInterceptors/responseInterceptors', 'statuses'], (responseInterceptors, statuses) ->
	'use strict'

	responseInterceptors.config ['$httpProvider', ($httpProvider) ->
		$httpProvider.responseInterceptors.push ['$rootScope', '$q', ($rootScope, $q) ->
			success = (response) ->
				status = statuses[response.status]

				$rootScope.$broadcast "success:#{response.status}", response
				$rootScope.$broadcast("success:#{status}", response)  if status

				response

			error = (response) ->
				status = statuses[response.status]
				deferred = $q.defer()

				$rootScope.$broadcast "error:#{response.status}", response
				$rootScope.$broadcast("error:#{status}", response)  if status
				deferred.promise()
				$q.reject response

			(promise) ->
				promise.then success, error
		]
	]