###global define###

define ['controllers/controllers', 'services/people'], (controllers) ->
	'use strict'

	controllers.controller 'people', ['$scope', 'people', ($scope, service) ->
		$scope.people = service.people

		$scope.insertPerson = ->
			service.post()

		service.get()
	]