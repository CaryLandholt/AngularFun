###global define###

define ['controllers/controllers', 'services/gitHub'], (controllers) ->
	'use strict'

	controllers.controller 'gitHub', ['$scope', '$rootScope', '$location', 'gitHub', ($scope, $rootScope, $location, service) ->
		$scope.searchTerm = ''
		$scope.repos = service.repos

		$scope.search = (searchTerm) ->
			$location.path "/github/#{searchTerm}"

		$rootScope.$on 'gitHub$afterRouteChange', (event, currentRoute, priorRoute) ->
			$scope.searchTerm = currentRoute.params.searchTerm

			service.get $scope.searchTerm

			$scope.$emit 'changeTab#gitHub'
	]