###global define###

define ['angular', 'controllers/controllers', 'services/peopleService'], (angular, controllers) ->
	'use strict'

	controllers.controller 'peopleController', ['$scope', '$location', 'peopleService', ($scope, $location, peopleService) ->
		$scope.people = peopleService.get()

		$scope.insertPerson = ->
			$scope.people = peopleService.post()
	]