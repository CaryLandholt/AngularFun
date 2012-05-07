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
,
	[
		'use!angular',
		'app',
		'controllers/firstController',
		'controllers/gitHubController',
		'controllers/secondController',
		'controllers/twitterController',
		'controllers/twitterSearchHistoryController',
		'directives/link',
		'directives/tabs',
		'directives/tab',
		'filters/twitterfy'
	],
	(angular, app) ->
		'use strict'

		#angular.element(document).ready ->
		#	angular.bootstrap document, ['app']

		angular.bootstrap window.document, ['app']