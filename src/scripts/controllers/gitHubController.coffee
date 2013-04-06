angular.module('app').controller 'gitHubController', ['$log', '$scope', '$location', 'gitHubService', ($log, $scope, $location, gitHubService) ->
	$scope.search = (searchTerm) ->
		$location.path "/github/#{searchTerm}"

	$scope.onRouteChange = (routeParams) ->
		$scope.searchTerm = routeParams.searchTerm

		gitHubService.get($scope.searchTerm).then (results) ->
			$scope.repos = results
]