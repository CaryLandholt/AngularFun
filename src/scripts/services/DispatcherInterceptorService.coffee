class DispatcherInterceptorService
	constructor: ($log, $rootScope, $q) ->
		return {
			response: (response) ->
				$rootScope.$broadcast "success:#{response.status}", response

				response
			responseError: (response) ->
				$rootScope.$broadcast "error:#{response.status}", response

				$q.reject response
		}

angular.module('app').service 'dispatcherInterceptorService' ['$log', '$rootScope', '$q', DispatcherInterceptorService]