###global define###

define ['directives/directives'], (directives) ->
	'use strict'

	directives.directive 'ngController', ['$log', '$rootScope', ($log, $rootScope) ->
		link = (scope, element, attrs, controller) ->
			$rootScope.$on "#{attrs.ngController}$routeChangeSuccess", (event, currentRoute, priorRoute) ->
				scope.onRouteChange(currentRoute.params) if scope.onRouteChange

		link: link
		restrict: 'A'
	]