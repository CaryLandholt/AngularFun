angular.module('app').service 'twitterService', ['$log', '$q', '$resource', 'messageService', ($log, $q, $resource, messageService) ->
	self = @

	activity = $resource 'http://search.twitter.com/search.json',
		callback: 'JSON_CALLBACK',
			get:
				method: 'JSONP'

	get = (criteria) ->
		defer = $q.defer()

		activity.get q: criteria, (results) ->
			messageService.publish 'search', source: 'Twitter', criteria: criteria
			defer.resolve results.results
		, (results) ->
			$log.error 'twitterService error', results
			defer.reject results

		defer.promise

	self.get = get
]