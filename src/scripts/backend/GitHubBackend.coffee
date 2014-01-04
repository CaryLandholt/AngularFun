class GitHubBackendRun
	constructor: ($httpBackend) ->
		$httpBackend.whenJSONP(/api.github.com/).passThrough()