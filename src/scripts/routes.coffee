class Config
	constructor: ($routeProvider) ->
		$routeProvider
		.when '/github/:id',
			controller: 'gitHubController'
		.otherwise
			redirectTo: '/github'

angular.module('app').config ['$routeProvider', Config]