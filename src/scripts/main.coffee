require
	paths:
		'libs/angular'                       : 'libs/angular.min'
		'libs/angular-resource'              : 'libs/angular-resource.min'
		'libs/angular-route'                 : 'libs/angular-route.min'
	shim:
		'controllers/gitHubController'       : deps: ['libs/angular', 'app', 'services/gitHubService']
		'controllers/personController'       : deps: ['libs/angular', 'app', 'services/personService']
		'controllers/personDetailsController': deps: ['libs/angular', 'app', 'services/personService']
		'controllers/searchHistoryController': deps: ['libs/angular', 'app', 'services/messageService']
		'directives/tab'                     : deps: ['libs/angular', 'app']
		'directives/tabs'                    : deps: ['libs/angular', 'app', 'directives/tab']
		'filters/twitterfy'                  : deps: ['libs/angular', 'app']
		'interceptors/dispatcher'            : deps: ['libs/angular', 'app']
		'libs/angular-resource'              : deps: ['libs/angular']
		'libs/angular-route'                 : deps: ['libs/angular']
		'services/gitHubService'             : deps: ['libs/angular', 'libs/angular-resource', 'app', 'services/messageService']
		'services/messageService'            : deps: ['libs/angular', 'app']
		'services/personService'             : deps: ['libs/angular', 'libs/angular-resource', 'app']
		'app'                                : deps: ['libs/angular', 'libs/angular-resource', 'libs/angular-route']
		'bootstrap'                          : deps: ['libs/angular', 'app']
		'routes'                             : deps: ['libs/angular', 'libs/angular-route', 'app']
		'run'                                : deps: ['libs/angular', 'app']
		'views'                              : deps: ['libs/angular', 'app']
	[
		'require'
		'controllers/gitHubController'
		'controllers/personController'
		'controllers/personDetailsController'
		'controllers/searchHistoryController'
		'directives/tabs'
		'filters/twitterfy'
		'interceptors/dispatcher'
		'routes'
		'run'
		'views'
	], (require) ->
		angular.element(window.document).ready ->
			require ['bootstrap']