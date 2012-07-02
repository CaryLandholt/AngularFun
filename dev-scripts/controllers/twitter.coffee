###global define###

define ['controllers/controllers', 'services/twitter'], (controllers) ->
	'use strict'

	controllers.controller 'twitter', ['$scope', '$rootScope', '$location', 'twitter', ($scope, $rootScope, $location, service) ->
		$scope.searchTerm = ''
		$scope.tweets = service.tweets

		$scope.search = (searchTerm) ->
			$location.path "/twitter/#{searchTerm}"

		$scope.onRouteChange = (routeParams) ->
			$scope.searchTerm = routeParams.searchTerm

			service.get $scope.searchTerm
	]