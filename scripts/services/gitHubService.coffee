###global define###

define ['services/services', 'services/messageService'], (services) ->
	'use strict'

	repos = {}

	services.factory 'gitHubService', ['$resource', 'messageService', ($resource, messageService) ->
		repos: repos

		get: (criteria) ->
			messageService.publish 'search', {source: 'GitHub', criteria: criteria.user}

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
	]