class GitHubResolver
	constructor: ($log, $rootScope) ->
		$rootScope.tab = 'GitHub'

class PersonDetailsResolver
	constructor: ($log, $rootScope) ->
		$rootScope.tab = 'People'

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