angular.module('app').controller 'gitHubController', ['$log', '$scope', '$rootScope', '$location', 'gitHubService', ($log, $scope, $rootScope, $location, gitHubService) ->
	$scope.search = (searchTerm) ->
		$location.path "/github/#{searchTerm}"

	$scope.onRouteChange = (routeParams) ->
		$scope.searchTerm = routeParams.searchTerm

		gitHubService.get $scope.searchTerm
		, (repos) ->
			$scope.repos = repos
]