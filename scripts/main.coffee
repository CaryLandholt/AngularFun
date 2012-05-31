###global require###

###
https://github.com/jrburke/requirejs/tree/dev2.0
https://github.com/jrburke/requirejs/wiki/Requirejs-2.0-draft
###
require
	shim:
		'libs/angular':
			deps: ['libs/modernizr']
			exports: 'angular'
		'libs/angular-resource': ['libs/angular']
		'libs/modernizr':
			exports: 'Modernizr'
	[
		'app'
		'bootstrap'
		'controllers/gitHub'
		'controllers/people'
		'controllers/personDetails'
		'controllers/searchHistory'
		'controllers/twitter'
		'directives/tabs'
		'directives/tab'
		'filters/twitterfy'
		'libs/angular'
		'responseInterceptors/dispatcher'
	], (app) ->
		'use strict'

		app.config ['$routeProvider', ($routeProvider) ->
			$routeProvider
			.when '/github/:searchTerm'
				controller: 'gitHub'
				reloadOnSearch: true
			.when '/people/details/:id'
				controller: 'personDetails'
				reloadOnSearch: true
			.when '/twitter/:searchTerm'
				controller: 'twitter'
				reloadOnSearch: true
			.otherwise
				redirectTo: '/github/CaryLandholt'
		]

		app.run ['$rootScope', '$log', ($rootScope, $log) ->
			$rootScope.$on 'error:unauthorized', (event, response) ->
				$log.error 'unauthorized'

			$rootScope.$on 'error:forbidden', (event, response) ->
				$log.error 'forbidden'

			$rootScope.$on 'error:403', (event, response) ->
				$log.error '403'

			$rootScope.$on 'success:ok', (event, response) ->
				$log.info 'success'

			$rootScope.$on '$afterRouteChange', (event, currentRoute, priorRoute) ->
				$rootScope.$emit "#{currentRoute.controller}$afterRouteChange", currentRoute, priorRoute
		]