###global define###

define ['controllers/controllers', 'services/twitter'], (controllers) ->
	'use strict'

	controllers.controller 'twitter', ['$scope', '$rootScope', '$location', 'twitter', '$log', ($scope, $rootScope, $location, service, $log) ->
		$scope.searchTerm = ''
		$scope.tweets = service.tweets

		$scope.search = (searchTerm) ->
			$location.path "/twitter/#{searchTerm}"

		$rootScope.$on 'twitter$afterRouteChange', (event, currentRoute, priorRoute) ->
			$scope.searchTerm = currentRoute.params.searchTerm

			service.get $scope.searchTerm, (Resource, getResponseHeaders) ->
				return
				#$log.info 'twitter.get success', Resource, getResponseHeaders()
			, (obj) ->
				return
				#$log.error 'twitter.get error', obj.config, obj.headers(), obj.status, obj.data

			$scope.$emit 'changeTab#twitter'
	]