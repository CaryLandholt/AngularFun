do (angular) ->
	'use strict'

	class PersonService
		constructor: ($log, $resource) ->
			Person = $resource './people/:id'

			PersonService::get = ->
				Person.query().$promise

			PersonService::getPerson = (id) ->
				Person.get({id}).$promise

			PersonService::save = (person) ->
				newPerson = new Person person

				newPerson.$save()

	angular.module('app').service 'personService', ['$log', '$resource', PersonService]