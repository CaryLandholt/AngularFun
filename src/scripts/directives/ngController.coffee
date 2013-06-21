do (angular) ->
	'use strict'

	class Controller
		constructor: ($log, $rootScope) ->
			link = (scope, element, attrs, controller) ->
				controllerName = attrs.ngController.split(' ')[0]

				$rootScope.$on "#{controllerName}$routeChangeSuccess", (event, currentRoute, priorRoute) ->
					controller.onRouteChange(currentRoute.params) if controller.onRouteChange

			return {
				link
				require: 'ngController'
				restrict: 'A'
			}

	angular.module('app').directive 'ngController', ['$log', '$rootScope', Controller]