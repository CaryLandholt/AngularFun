###global require, window###

###
https://github.com/jrburke/requirejs/tree/dev2.0
https://github.com/jrburke/requirejs/wiki/Requirejs-2.0-draft
###
require
	paths:
		angular: 'libs/angular'
		angularResource: 'libs/angular-resource'
		modernizr: 'libs/modernizr'
		text: 'libs/text'
	shim:
		angular:
			deps: ['modernizr']
			exports: 'angular'
		angularResource: ['angular']
		modernizr:
			exports: 'Modernizr'
	[
		'angular'
		'app'
		'controllers/gitHubController'
		'controllers/peopleController'
		'controllers/searchHistoryController'
		'controllers/twitterController'
		'directives/link'
		'directives/tabs'
		'directives/tab'
		'filters/twitterfy'
	], (angular, app) ->
		'use strict'

		app.config ['$routeProvider', ($routeProvider) ->
			$routeProvider
			.when '/twitter/:searchTerm'
				controller: 'twitterController'
				reloadOnSearch: true
			.when '/github/:searchTerm'
				controller: 'gitHubController'
				reloadOnSearch: true
			.otherwise redirectTo: '/twitter/@CaryLandholt'
		]

		require ['libs/domReady!'], (document) ->
			angular.bootstrap document, ['app']