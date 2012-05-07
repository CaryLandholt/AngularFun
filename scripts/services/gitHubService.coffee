###global define###

define ['services/services'], (services) ->
	'use strict'

	repos = {}
	searchHistory = []

	service = ($resource) ->
		repos: repos
		searchHistory: searchHistory

		get: (criteria) ->
			searchHistory.push criteria.user

			repos = $resource 'https://github.com/api/v2/json/repos/show/:user',
				{
					user: 'CaryLandholt'
					callback: 'JSON_CALLBACK'
				}
				{
					query:
						method: 'JSONP'
				}

			repos.query criteria, (Resource, getResponseHeaders) ->
				console.log 'success', Resource, getResponseHeaders()
			, (obj) ->
				console.log 'error', obj.config, obj.headers(), obj.status

	services.factory 'gitHubService', ['$resource', service]

	service