class Service
	constructor: (@$log, @$http, @messageService) ->

	get: (criteria) ->
		@$http.jsonp("https://api.github.com/users/#{criteria}/repos", params: callback: 'JSON_CALLBACK')
		.success (results) =>
			@messageService.publish 'search', source: 'GitHub', criteria: criteria
		.error (results) =>
			@$log.error 'gitHubService error', results
		.then (results) ->
			results.data.data

angular.module('app').service 'gitHubService', ['$log', '$http', 'messageService', Service]