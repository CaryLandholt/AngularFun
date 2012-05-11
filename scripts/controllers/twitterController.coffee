###global define###

define ['use!angular', 'controllers/controllers', 'services/twitterService'], (angular, controllers) ->
	'use strict'

	controllers.controller 'twitterController', ['$scope', '$location', 'twitterService', ($scope, $location, twitterService) ->
		$scope.searchTerm = ''
		$scope.tweets = twitterService.tweets

		$scope.search = (searchTerm) ->
			$location.path "/twitter/#{searchTerm}"

		$scope.$on '$afterRouteChange', (event, currentRoute, priorRoute) ->
			searchTerm = currentRoute.params.searchTerm

			if searchTerm
				$scope.searchTerm = searchTerm
				$scope.tweets = twitterService.get q: $scope.searchTerm
	]