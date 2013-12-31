class SearchHistoryController
	constructor: (@$log, @messageService) ->
		@searchHistory = []

		@messageService.subscribe 'search', (name, parameters) =>
			@searchHistory.push parameters