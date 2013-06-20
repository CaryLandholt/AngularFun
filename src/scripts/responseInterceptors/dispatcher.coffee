do (angular) ->
	'use strict'

	class Dispatcher
		constructor: ($log, $rootScope, $q) ->
			Dispatcher::success = (response) ->
				$rootScope.$broadcast "success:#{response.status}", response

				response

			Dispatcher::error = (response) ->
				deferred = $q.defer()

				$rootScope.$broadcast "error:#{response.status}", response

				$q.reject response

			return (promise) ->
				promise.then Dispatcher::success, Dispatcher::error

	class ResponseInterceptor
		constructor: ($httpProvider) ->
			$httpProvider.responseInterceptors.push ['$log', '$rootScope', '$q', Dispatcher]

	angular.module('app').config ['$httpProvider', ResponseInterceptor]