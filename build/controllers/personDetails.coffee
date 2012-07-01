###global define###

define ['controllers/controllers', 'services/people'], (controllers) ->
	'use strict'

	controllers.controller 'personDetails', ['$scope', '$rootScope', 'people', ($scope, $rootScope, service) ->
		$scope.person = service.person

		$scope.onRouteChange = (routeParams) ->
			service.getPerson routeParams.id
	]