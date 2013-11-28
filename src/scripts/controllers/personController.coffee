class Controller
	constructor: (@$log, @personService) ->
		setPeople = =>
			@personService.get().then (results) =>
				@people = results

		@insertPerson = (person) =>
			@personService.save(person)
			.success (results) =>
				@error = ''
				@person = {}

				setPeople()
			.error (results, status) =>
				if status is 403
					@error = results
			.then (results) ->
				results

		setPeople()

angular.module('app').controller 'personController', ['$log', 'personService', Controller]