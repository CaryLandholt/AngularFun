class SearchHistoryController
	constructor: ($log, messageService) ->
		@searchHistory = []

		messageService.subscribe 'search', (name, parameters) =>
			@searchHistory.push parameters

angular.module('app').controller 'searchHistoryController', ['$log', 'messageService', SearchHistoryController]