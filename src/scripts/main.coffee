requirejs
	shim:
		'controllers/gitHubController': deps: ['libs/angular', 'app', 'services/gitHubService']
		'controllers/personController': deps: ['libs/angular', 'app', 'services/personService']
		'controllers/personDetailsController': deps: ['libs/angular', 'app', 'services/personService']
		'controllers/searchHistoryController': deps: ['libs/angular', 'app', 'services/messageService']
		'controllers/twitterController': deps: ['libs/angular', 'app', 'services/twitterService']
		'directives/ngController': deps: ['libs/angular', 'app']
		'directives/tab': deps: ['libs/angular', 'app']
		'directives/tabs': deps: ['libs/angular', 'app', 'directives/tab']
		'filters/twitterfy': deps: ['libs/angular', 'app']
		'libs/angular-resource': deps: ['libs/angular']
		'responseInterceptors/dispatcher': deps: ['libs/angular', 'app']
		'services/gitHubService': deps: ['libs/angular', 'app', 'libs/angular-resource', 'services/messageService']
		'services/messageService': deps: ['libs/angular', 'app']
		'services/personService': deps: ['libs/angular', 'app', 'libs/angular-resource']
		'services/twitterService': deps: ['libs/angular', 'app', 'libs/angular-resource', 'services/messageService']
		'app': deps: ['libs/angular', 'libs/angular-resource']
		'bootstrap': deps: ['libs/angular', 'app']
		'routes': deps: ['libs/angular', 'app']
		'run': deps: ['libs/angular', 'app']
	[
		'require'
		'controllers/gitHubController'
		'controllers/personController'
		'controllers/personDetailsController'
		'controllers/searchHistoryController'
		'controllers/twitterController'
		'directives/ngController'
		'directives/tabs'
		'filters/twitterfy'
		'responseInterceptors/dispatcher'
		'routes'
		'run'
	], ->
		require 'bootstrap'