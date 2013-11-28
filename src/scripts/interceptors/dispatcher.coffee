class Interceptor
	constructor: ($log, $rootScope, $q) ->
		return {
			response: (response) ->
				$rootScope.$broadcast "success:#{response.status}", response

				response
			responseError: (response) ->
				$rootScope.$broadcast "error:#{response.status}", response

				$q.reject response
		}

class Config
	constructor: ($httpProvider) ->
		$httpProvider.interceptors.push ['$log', '$rootScope', '$q', Interceptor]

angular.module('app').config ['$httpProvider', Config]