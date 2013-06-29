class GitHubController
	constructor: ($log, gitHubService) ->
		@search = (searchTerm) =>
			@repos = gitHubService.get searchTerm

angular.module('app').controller 'gitHubController', ['$log', 'gitHubService', GitHubController]