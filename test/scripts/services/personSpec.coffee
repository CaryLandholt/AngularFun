beforeEach module 'app'

beforeEach ->
	this.addMatchers { toEqualData: (expected) ->
		angular.equals this.actual, expected }

describe 'person service', ->
	personService = {}
	$httpBackend = {}
	beforeEach inject (_$httpBackend_, $injector) ->
		$httpBackend = _$httpBackend_
		$httpBackend.expectGET('./people')
		.respond [{name: 'Bob'}]

		personService = $injector.get('personService')

	it 'should query for people at /people and receive an array', ->
		success = (result) ->
			expect(result).toEqualData [{name: 'Bob'}]
		failure = ->
			#we should not get a failure in this test:
			expect(true).toBe(false)

		personService.get success, failure
		# $httpBackend.flush()