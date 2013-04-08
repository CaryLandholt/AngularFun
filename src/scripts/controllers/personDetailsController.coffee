angular.module('app').controller 'personDetailsController', ['$log', '$scope', 'personService', ($log, $scope, personService) ->
	$scope.onRouteChange = (routeParams) ->
		id = routeParams.id

		personService.getPerson(id).then (results) ->
			$scope.person = results
]