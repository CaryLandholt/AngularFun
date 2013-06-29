class PersonDetailsController
	constructor: ($log, personService) ->
		@onRouteChange = (routeParams) =>
			@person = personService.getPerson routeParams.id

angular.module('app').controller 'personDetailsController', ['$log', 'personService', PersonDetailsController]