class Run
	constructor: ($log, $rootScope) ->
		$rootScope.$on '$routeChangeSuccess', (event, currentRoute, priorRoute) ->
			$rootScope.$broadcast "#{currentRoute.controller}$routeChangeSuccess", currentRoute, priorRoute

angular.module('app').run ['$log', '$rootScope', Run]