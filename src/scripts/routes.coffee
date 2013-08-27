class Routes
	constructor: ($routeProvider) ->
		$routeProvider
		.when '/github/',
			controller: 'gitHubController'
		.otherwise
			redirectTo: '/github'

angular.module('app').config ['$routeProvider', Routes]