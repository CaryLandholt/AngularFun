class SearchHistoryController
	constructor: (messageService) ->
		@searchHistory = []

		messageService.subscribe 'search', (name, parameters) =>
			@searchHistory.push parameters