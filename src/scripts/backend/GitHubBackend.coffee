class GitHubBackend extends Run
	constructor: ($httpBackend) ->
		$httpBackend.whenJSONP(/api.github.com/).passThrough()