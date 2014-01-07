class Person extends Controller
	constructor: (personService, STATUSES) ->
		setPeople = =>
			personService.get().then (results) =>
				@people = results

		@insertPerson = (person) =>
			personService.save(person)
			.success (results) =>
				@error = ''
				@person = {}

				setPeople()
			.error (results, status) =>
				if STATUSES[status] is 'Forbidden'
					@error = results
			.then (results) ->
				results

		setPeople()