angular.module('app').config ['$routeProvider', ($routeProvider) ->
	$routeProvider
	.when '/github/:searchTerm'
		controller: 'gitHubController'
		reloadOnSearch: true
		resolve:
			changeTab: ['$rootScope', ($rootScope) ->
				$rootScope.$broadcast 'changeTab#gitHub'
			]
	.when '/people/:id'
		controller: 'personDetailsController'
		reloadOnSearch: true
		resolve:
			changeTab: ['$rootScope', ($rootScope) ->
				$rootScope.$broadcast 'changeTab#people'
			]
	.when '/twitter/:searchTerm'
		controller: 'twitterController'
		reloadOnSearch: true
		resolve:
			changeTab: ['$rootScope', ($rootScope) ->
				$rootScope.$broadcast 'changeTab#twitter'
			]
	.otherwise
		redirectTo: '/github/CaryLandholt'
]