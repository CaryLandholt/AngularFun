###global define###

define ['use!angular', 'controllers/controllers', 'services/myService'], (angular, controllers) ->
	'use strict'

	controller = ($scope, myService) ->
		$scope.name = 'Cary David Landholt'
		$scope.people = myService.query()

	controllers.controller 'firstController', ['$scope', 'myService', controller]

	controller