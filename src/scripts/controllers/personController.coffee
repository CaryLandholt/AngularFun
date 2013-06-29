class PersonController
	constructor: ($log, $location, personService) ->
		@people = personService.get()

		@insertPerson = (person) =>
			personService.save(person)
			.then (results) =>
				@error = ''
				@person = {}
				@people = personService.get()
			, (results) =>
				if results.status is 403
					@error = results.data

angular.module('app').controller 'personController', ['$log', '$location', 'personService', PersonController]