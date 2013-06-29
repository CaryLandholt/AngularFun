class Dispatcher
	constructor: ($log, $rootScope, $q) ->
		return {
			response: (response) ->
				$rootScope.$broadcast "success:#{response.status}", response

				response
			responseError: (response) ->
				$rootScope.$broadcast "error:#{response.status}", response

				$q.reject response
		}

class Interceptor
	constructor: ($httpProvider) ->
		$httpProvider.interceptors.push ['$log', '$rootScope', '$q', Dispatcher]

angular.module('app').config ['$httpProvider', Interceptor]