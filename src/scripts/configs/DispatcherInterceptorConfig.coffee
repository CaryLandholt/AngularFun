class DispatcherInterceptorConfig
	constructor: ($httpProvider) ->

		$httpProvider.interceptors.push 'DispatcherInterceptor'

angular.module('app').config ['$httpProvider', DispatcherInterceptorConfig]