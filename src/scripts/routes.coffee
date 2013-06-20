do (angular) ->
	'use strict'

	class Routes
		constructor: ($routeProvider) ->
			$routeProvider
			.when '/github/:searchTerm',
				controller: 'gitHubController'
				reloadOnSearch: true
				resolve:
					changeTab: ['$rootScope', ($rootScope) ->
						$rootScope.$broadcast 'changeTab#gitHub'
					]
			.when '/people/:id',
				controller: 'personDetailsController'
				reloadOnSearch: true
				resolve:
					changeTab: ['$rootScope', ($rootScope) ->
						$rootScope.$broadcast 'changeTab#people'
					]
			.otherwise
				redirectTo: '/github'

	angular.module('app').config ['$routeProvider', Routes]