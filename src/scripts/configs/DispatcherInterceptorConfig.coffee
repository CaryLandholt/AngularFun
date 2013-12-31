class DispatcherInterceptorConfig
	constructor: ($httpProvider) ->
		$httpProvider.interceptors.push 'DispatcherInterceptor'