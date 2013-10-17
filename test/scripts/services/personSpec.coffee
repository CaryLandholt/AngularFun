describe "personService", ->
	beforeEach module 'app'

	beforeEach ->
		@addMatchers {
			toEqualData: (expected) ->
				angular.equals @actual, expected
		}

	it 'should get people', inject ['$httpBackend', 'personService', ($httpBackend, personService) ->
		expected = [{name: 'foo'}]
		notExpected = [{name: 'bar'}]

		$httpBackend
			.expectGET('/people')
			.respond(expected)

		positiveTestSuccess = (results) ->
			expect(results).toEqualData expected

			results

		negativeTestSuccess = (results) ->
			expect(results).not.toEqualData notExpected

			results

		personService.get()
			.then(positiveTestSuccess)
			.then(negativeTestSuccess)


		$httpBackend.flush()
	]

	it 'should get person', inject ['$httpBackend', 'personService', ($httpBackend, personService) ->
		expected = {name: 'foo'}
		notExpected = {name: 'bar'}

		$httpBackend
			.expectGET('/people/1')
			.respond(expected)

		positiveTestSuccess = (results) ->
			expect(results).toEqualData expected

			results

		negativeTestSuccess = (results) ->
			expect(results).not.toEqualData notExpected

			results

		personService.getPerson(1)
			.then(positiveTestSuccess)
			.then(negativeTestSuccess)


		$httpBackend.flush()
	]