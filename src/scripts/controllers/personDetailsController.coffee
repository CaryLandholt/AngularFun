angular.module('app').controller 'personDetailsController', ['$log', '$scope', '$rootScope', 'personService', ($log, $scope, $rootScope, personService) ->
	$scope.onRouteChange = (routeParams) ->
		personService.getPerson routeParams.id
		, (person) ->
			$scope.person = person
]