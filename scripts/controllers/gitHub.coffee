###global define###

define ['controllers/controllers', 'services/gitHub'], (controllers) ->
	'use strict'

	controllers.controller 'gitHub', ['$scope', '$rootScope', '$location', 'gitHub', '$log', ($scope, $rootScope, $location, service, $log) ->
		$scope.searchTerm = ''
		$scope.repos = service.repos

		$scope.search = (searchTerm) ->
			$location.path "/github/#{searchTerm}"

		$rootScope.$on 'gitHub$afterRouteChange', (event, currentRoute, priorRoute) ->
			$scope.searchTerm = currentRoute.params.searchTerm

			service.get $scope.searchTerm, (Resource, getResponseHeaders) ->
				return
				#$log.info 'gitHub.get success', Resource, getResponseHeaders()
			, (obj) ->
				return
				#$log.error 'gitHub.get error', obj.config, obj.headers(), obj.status, obj.data

			$scope.$emit 'changeTab#gitHub'
	]