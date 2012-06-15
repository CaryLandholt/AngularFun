###global define###

define ['controllers/controllers', 'services/gitHub'], (controllers) ->
	'use strict'

	controllers.controller 'gitHub', ['$scope', '$rootScope', '$location', 'gitHub', ($scope, $rootScope, $location, service) ->
		$scope.searchTerm = ''
		$scope.repos = service.repos

		$scope.search = (searchTerm) ->
			$location.path "/github/#{searchTerm}"

		$scope.onRouteChange = (routeParams) ->
			$scope.searchTerm = routeParams.searchTerm

			service.get $scope.searchTerm
	]