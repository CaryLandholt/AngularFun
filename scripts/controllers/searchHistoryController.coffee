###global define###

define ['use!angular', 'controllers/controllers', 'services/messageService'], (angular, controllers) ->
	'use strict'

	searchHistory = []

	controllers.controller 'searchHistoryController', ['$scope', 'messageService', ($scope, messageService) ->
		$scope.searchHistory = searchHistory

		messageService.subscribe 'search', (name, parameters) ->
			$scope.searchHistory.push parameters
	]