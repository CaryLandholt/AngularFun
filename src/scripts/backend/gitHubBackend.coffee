class GitHubBackendRun
	constructor: (@$log, @$httpBackend) ->
		@$httpBackend.whenJSONP(/api.github.com/).passThrough()

angular.module('app').run ['$log', '$httpBackend', GitHubBackendRun]