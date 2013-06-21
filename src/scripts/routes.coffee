do (angular) ->
	'use strict'

	class GitHubResolver
		constructor: ($log, $rootScope) ->
			$rootScope.$broadcast 'changeTab#gitHub'

	class PersonDetailsResolver
		constructor: ($log, $rootScope) ->
			$rootScope.$broadcast 'changeTab#people'

	class Routes
		constructor: ($routeProvider) ->
			$routeProvider
			.when '/github/:searchTerm',
				controller: 'gitHubController'
				reloadOnSearch: true
				resolve:
					changeTab: ['$log', '$rootScope', GitHubResolver]
			.when '/people/:id',
				controller: 'personDetailsController'
				reloadOnSearch: true
				resolve:
					changeTab: ['$log', '$rootScope', PersonDetailsResolver]
			.otherwise
				redirectTo: '/github'

	angular.module('app').config ['$routeProvider', Routes]