###global define###

define ['services/services', 'services/messageService'], (services) ->
	'use strict'

	tweets = {}

	services.factory 'twitterService', ['$resource', 'messageService', ($resource, messageService) ->
		tweets: tweets

		get: (criteria) ->
			messageService.publish 'search', {source: 'Twitter', criteria: criteria.q}

			tweets = $resource 'http://search.twitter.com/:action',
				{
					action: 'search.json'
					q: '@CaryLandholt'
					callback: 'JSON_CALLBACK'
				}
				{
					query:
						method: 'JSONP'
				}

			tweets.query criteria, (Resource, getResponseHeaders) ->
				console.log 'success', Resource, getResponseHeaders()
			, (obj) ->
				console.log 'error', obj.config, obj.headers(), obj.status
	]