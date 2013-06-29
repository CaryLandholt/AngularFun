require
	shim:
		'controllers/gitHubController'       : deps: ['app', 'services/gitHubService']
		'controllers/personController'       : deps: ['app', 'services/personService']
		'controllers/personDetailsController': deps: ['app', 'services/personService']
		'controllers/searchHistoryController': deps: ['app', 'services/messageService']
		'directives/ngController'            : deps: ['app']
		'directives/tab'                     : deps: ['app']
		'directives/tabs'                    : deps: ['app', 'directives/tab']
		'filters/twitterfy'                  : deps: ['app']
		'interceptors/dispatcher'            : deps: ['app']
		'libs/angular-resource'              : deps: ['libs/angular']
		'libs/angular-route'                 : deps: ['libs/angular']
		'services/gitHubService'             : deps: ['app', 'services/messageService']
		'services/messageService'            : deps: ['app']
		'services/personService'             : deps: ['app']
		'app'                                : deps: ['libs/angular', 'libs/angular-resource', 'libs/angular-route']
		'bootstrap'                          : deps: ['app']
		'routes'                             : deps: ['app']
		'run'                                : deps: ['app']
		'views'                              : deps: ['app']
	[
		'require'
		'controllers/gitHubController'
		'controllers/personController'
		'controllers/personDetailsController'
		'controllers/searchHistoryController'
		'directives/ngController'
		'directives/tabs'
		'filters/twitterfy'
		'interceptors/dispatcher'
		'routes'
		'run'
		'views'
	], (require) ->
		angular.element(window.document).ready ->
			require ['bootstrap']