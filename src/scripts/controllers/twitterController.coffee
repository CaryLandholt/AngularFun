###global define###

define ['controllers/controllers', 'services/twitterService'], (controllers) ->
	'use strict'

	controllers.controller 'twitterController', ['$log', '$scope', '$rootScope', '$location', 'twitterService', ($log, $scope, $rootScope, $location, twitterService) ->
		$scope.search = (searchTerm) ->
			$location.path "/twitter/#{searchTerm}"

		$scope.onRouteChange = (routeParams) ->
			$scope.searchTerm = routeParams.searchTerm

			twitterService.get $scope.searchTerm
			, (tweets) ->
				$scope.tweets = tweets
	]