###global define###

define ['controllers/controllers', 'services/people'], (controllers) ->
	'use strict'

	controllers.controller 'personDetails', ['$scope', '$rootScope', 'people', ($scope, $rootScope, service) ->
		$scope.person = service.person

		$rootScope.$on 'personDetails$routeChangeSuccess', (event, currentRoute, priorRoute) ->
			id = currentRoute.params.id

			service.getPerson id
			$scope.$broadcast 'changeTab#people'
	]