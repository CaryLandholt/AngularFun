angular.module('app').run ['$rootScope', '$log', ($rootScope, $log) ->
	$rootScope.$on 'error:unauthorized', (event, response) ->
		#$log.error 'unauthorized'

	$rootScope.$on 'error:forbidden', (event, response) ->
		#$log.error 'forbidden'

	$rootScope.$on 'error:403', (event, response) ->
		#$log.error '403'

	$rootScope.$on 'success:ok', (event, response) ->
		#$log.info 'success'

	# fire an event related to the current route
	$rootScope.$on '$routeChangeSuccess', (event, currentRoute, priorRoute) ->
		$rootScope.$broadcast "#{currentRoute.controller}$routeChangeSuccess", currentRoute, priorRoute
]