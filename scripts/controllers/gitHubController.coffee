###global define###

define ['use!angular', 'controllers/controllers', 'services/gitHubService'], (angular, controllers) ->
	'use strict'

	controller = ($scope, gitHubService) ->
		$scope.searchTerm = ''
		$scope.repos = gitHubService.repos

		$scope.search = (searchTerm) ->
			$scope.repos = gitHubService.get user: searchTerm


	controllers.controller 'gitHubController', ['$scope', 'gitHubService', controller]

	controller