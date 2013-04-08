angular.module('app').controller 'personController', ['$log', '$scope', '$location', 'personService', ($log, $scope, $location, personService) ->
	$scope.people = []

	$scope.insertPerson = (person) ->
		personService.save(person).then (results) ->
			$scope.error = ''
			$scope.person = {}

			$scope.people.push results
			$location.path "/people/#{results.id}"
		, (results) ->
			($scope.error = results.data) if results.status is 403

	personService.get().then (results) ->
		$scope.people = results
]