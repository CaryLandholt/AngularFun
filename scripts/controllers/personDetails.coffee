###global define###

define ['controllers/controllers', 'services/people'], (controllers) ->
	'use strict'

	controllers.controller 'personDetails', ['$scope', '$rootScope', 'people', ($scope, $rootScope, service) ->
		$scope.person = service.person

		$rootScope.$on 'personDetails$afterRouteChange', (event, currentRoute, priorRoute) ->
			id = currentRoute.params.id

			service.getPerson id
			$scope.$emit 'changeTab#people'
	]