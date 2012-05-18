###global define###

define ['use!angular', 'controllers/controllers', 'services/twitterService'], (angular, controllers) ->
	'use strict'

	controllers.controller 'twitterController', ['$scope', '$location', 'twitterService', ($scope, $location, twitterService) ->
		$scope.searchTerm = ''
		$scope.tweets = {}

		$scope.search = (searchTerm) ->
			$location.path "/twitter/#{searchTerm}"

		$scope.$on '$afterRouteChange', (event, currentRoute, priorRoute) ->
			return if not currentRoute or not currentRoute.$route or not currentRoute.$route.controller or currentRoute.$route.controller isnt 'twitterController'

			searchTerm = currentRoute.params.searchTerm

			if searchTerm
				$scope.searchTerm = searchTerm
				$scope.tweets = twitterService.get q: $scope.searchTerm
	]