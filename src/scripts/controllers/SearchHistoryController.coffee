class SearchHistory extends Controller
	constructor: (messageService) ->
		@searchHistory = []

		messageService.subscribe 'search', (name, parameters) =>
			@searchHistory.push parameters