class GitHubBackendRun
	constructor: (@$log, @$httpBackend) ->
		@$httpBackend.whenJSONP(/api.github.com/).passThrough()