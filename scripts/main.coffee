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
			.when '/twitter/:searchTerm'
				controller: 'twitter'
				reloadOnSearch: true
			.when '/github/:searchTerm'
				controller: 'gitHub'
				reloadOnSearch: true
			.otherwise
				redirectTo: '/twitter/@CaryLandholt'
		]

		app.run ['$rootScope', ($rootScope) ->
			$rootScope.$on 'error:unauthorized', (event, response) ->

			$rootScope.$on 'success:ok', (event, response) ->

			$rootScope.$on '$afterRouteChange', (event, currentRoute, priorRoute) ->
				$rootScope.$emit "#{currentRoute.controller}$afterRouteChange", currentRoute, priorRoute
		]