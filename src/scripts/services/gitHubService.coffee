angular.module('app').factory 'gitHubService', ['$log', '$resource', 'messageService', ($log, $resource, messageService) ->
	activity = $resource 'https://api.github.com/users/:user/repos',
		callback: 'JSON_CALLBACK',
			get:
				method: 'JSONP'

	get = (criteria, success, failure) ->
		activity.get user: criteria
		, (repos, getResponseHeaders) ->
			messageService.publish 'search', source: 'GitHub', criteria: criteria
			success(repos.data) if angular.isFunction success
		, failure

	{get}
]