###global define###

define ['use!angular', 'controllers/controllers'], (angular, controllers) ->
	'use strict'

	controller = ($scope) ->
		$scope.name = 'Saasha Landholt'

	controllers.controller 'secondController', ['$scope', controller]

	controller