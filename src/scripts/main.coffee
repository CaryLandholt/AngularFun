###global define, require###

requirejs
	map:
		'*':
			'libs/angularResource': 'libs/angular-resource'
	shim:
		'libs/angular':
			exports: 'angular'
		'libs/angularResource':
			deps: [
				'libs/angular'
			]
	[
		'app'
		'bootstrap'
		'controllers/gitHub'
		'controllers/people'
		'controllers/personDetails'
		'controllers/searchHistory'
		'controllers/twitter'
		'directives/ngController'
		'directives/tab'
		'directives/tabs'
		'filters/twitterfy'
		'responseInterceptors/dispatcher'
	], (app) ->
		app.config ['$routeProvider', ($routeProvider) ->
			$routeProvider
			.when '/github/:searchTerm'
				controller: 'gitHub'
				reloadOnSearch: true
				resolve:
					changeTab: ['$rootScope', ($rootScope) ->
						$rootScope.$broadcast 'changeTab#gitHub'
					]
			.when '/people/:id'
				controller: 'personDetails'
				reloadOnSearch: true
				resolve:
					changeTab: ['$rootScope', ($rootScope) ->
						$rootScope.$broadcast 'changeTab#people'
					]
			.when '/twitter/:searchTerm'
				controller: 'twitter'
				reloadOnSearch: true
				resolve:
					changeTab: ['$rootScope', ($rootScope) ->
						$rootScope.$broadcast 'changeTab#twitter'
					]
			.otherwise
				redirectTo: '/github/CaryLandholt'
		]

		app.run ['$rootScope', '$log', ($rootScope, $log) ->
			$rootScope.$on 'error:unauthorized', (event, response) ->
				#$log.error 'unauthorized'

			$rootScope.$on 'error:forbidden', (event, response) ->
				#$log.error 'forbidden'

			$rootScope.$on 'error:403', (event, response) ->
				#$log.error '403'

			$rootScope.$on 'success:ok', (event, response) ->
				#$log.info 'success'

			# fire an event related to the current route
			$rootScope.$on '$routeChangeSuccess', (event, currentRoute, priorRoute) ->
				$rootScope.$broadcast "#{currentRoute.controller}$routeChangeSuccess", currentRoute, priorRoute
		]