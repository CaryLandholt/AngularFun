angular.module('app').controller 'personController', ['$log', '$scope', '$location', 'personService', ($log, $scope, $location, personService) ->
	$scope.people = []

	$scope.insertPerson = (person) ->
		personService.save person
		, (person, getResponseHeaders) ->
			$scope.error = ''
			$scope.person = {}

			$scope.people.push person
			$location.path "/people/#{person.id}"
		, (error) ->
			($scope.error = error.data) if error.status is 403

	personService.get (people) ->
		$scope.people = people
]