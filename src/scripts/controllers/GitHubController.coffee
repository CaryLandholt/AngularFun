class GitHub extends Controller
	constructor: (gitHubService) ->
		@search = (searchTerm) =>
			gitHubService.get(searchTerm).then (results) =>
				@repos = results