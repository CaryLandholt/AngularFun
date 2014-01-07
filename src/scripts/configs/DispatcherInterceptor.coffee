class DispatcherInterceptor extends Config
	constructor: ($httpProvider) ->
		$httpProvider.interceptors.push 'DispatcherInterceptor'