###global define###

define ['services/services'], (services) ->
	'use strict'

	Array::clone = ->
		Array.apply null, this
	Array::sortIt = Array::sort
	Array::reverseIt = Array::reverse
	Array::sort = ->
		tmp = @clone()
		tmp.sortIt.apply tmp, arguments
	Array::reverse = ->
		tmp = @clone()
		tmp.reverseIt.apply tmp, arguments

	tweets = {}
	searchHistory = []

	service = ($resource) ->
		tweets: tweets
		searchHistory: searchHistory

		get: (criteria) ->
			searchHistory.push criteria.q

			tweets = $resource 'http://search.twitter.com/:action',
				{
					action: 'search.json'
					q: 'twitter'
					callback: 'JSON_CALLBACK'
				}
				{
					query:
						method: 'JSONP'
				}

			tweets.query criteria

	services.factory 'twitterService', ['$resource', service]

	service