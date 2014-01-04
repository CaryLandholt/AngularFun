class GitHubController
	constructor: (gitHubService) ->
		@search = (searchTerm) =>
			gitHubService.get(searchTerm).then (results) =>
				@repos = results