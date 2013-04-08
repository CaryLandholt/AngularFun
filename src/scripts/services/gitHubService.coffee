angular.module('app').service 'gitHubService', ['$log', '$q', '$resource', 'messageService', ($log, $q, $resource, messageService) ->
	self = @

	Repo = $resource 'https://api.github.com/users/:user/repos',
		callback: 'JSON_CALLBACK',
			get:
				method: 'JSONP'

	get = (criteria) ->
		defer = $q.defer()

		Repo.get user: criteria, (results) ->
			messageService.publish 'search', source: 'GitHub', criteria: criteria
			defer.resolve results.data
		, (results) ->
			$log.error 'gitHubService error', results
			defer.reject results

		defer.promise

	self.get = get
]