class DispatcherInterceptorConfig
	constructor: ($httpProvider, dispatcherInterceptorService) ->
		$httpProvider.interceptors.push dispatcherInterceptorService

angular.module('app').config ['$httpProvider', 'dispatcherInterceptorService', DispatcherInterceptorConfig]