###global require, window###

require
	paths:
		angular: 'libs/angular'
		angularResource: 'libs/angular-resource'
		text: 'libs/text'
		use: 'libs/use'
	use:
		angular:
			attach: 'angular'
		angularResource:
			deps: ['use!angular']
	[
		'use!angular'
		'app'
		'controllers/gitHubController'
		'controllers/searchHistoryController'
		'controllers/twitterController'
		'directives/link'
		'directives/tabs'
		'directives/tab'
		'filters/twitterfy'
		'helpers/array.reverse'
	], (angular, app) ->
		'use strict'

		app.config ['$routeProvider', ($routeProvider) ->
			$routeProvider
			.when '/twitter/:searchTerm'
				controller: 'twitterController'
				reloadOnSearch: true
			.otherwise redirectTo: '/twitter/@CaryLandholt'
		]

		angular.bootstrap window.document, ['app']