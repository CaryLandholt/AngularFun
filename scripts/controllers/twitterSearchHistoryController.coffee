###global define###

define ['use!angular', 'controllers/controllers', 'services/twitterService'], (angular, controllers) ->
	'use strict'

	controller = ($scope, twitterService) ->
		$scope.searchHistory = twitterService.searchHistory

	controllers.controller 'twitterSearchHistoryController', ['$scope', 'twitterService', controller]

	controller