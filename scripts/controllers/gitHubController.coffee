###global define###

define ['use!angular', 'controllers/controllers', 'services/gitHubService'], (angular, controllers) ->
	'use strict'

	controllers.controller 'gitHubController', ['$scope', '$location', 'gitHubService', ($scope, $location, gitHubService) ->
		$scope.searchTerm = ''
		$scope.repos = {}

		$scope.search = (searchTerm) ->
			$location.path "/github/#{searchTerm}"

		$scope.$on '$afterRouteChange', (event, currentRoute, priorRoute) ->
			return if not currentRoute or not currentRoute.$route or not currentRoute.$route.controller or currentRoute.$route.controller isnt 'gitHubController'

			searchTerm = currentRoute.params.searchTerm

			if searchTerm
				$scope.searchTerm = searchTerm
				$scope.repos = gitHubService.get user: searchTerm
	]