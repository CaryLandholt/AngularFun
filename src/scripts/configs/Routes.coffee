class Routes extends Config
	constructor: ($routeProvider) ->
		$routeProvider
		.when '/github/:id',
			controller: 'gitHubController'
		.otherwise
			redirectTo: '/github'