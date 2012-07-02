###global define###

define ['controllers/controllers', 'services/message'], (controllers) ->
	'use strict'

	controllers.controller 'searchHistory', ['$scope', 'message', ($scope, service) ->
		$scope.searchHistory = []

		service.subscribe 'search', (name, parameters) ->
			$scope.searchHistory.push parameters
	]