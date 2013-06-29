class GitHubService
	constructor: ($log, $resource, messageService) ->
		Repo = $resource 'https://api.github.com/users/:user/repos',
			callback: 'JSON_CALLBACK',
				get:
					method: 'JSONP'

		GitHubService::get = (criteria) ->
			Repo.get(user: criteria).$promise.then (results) ->
				messageService.publish 'search', source: 'GitHub', criteria: criteria

				results
			, (results) ->
				$log.error 'gitHubService error', results

				results

angular.module('app').service 'gitHubService', ['$log', '$resource', 'messageService', GitHubService]