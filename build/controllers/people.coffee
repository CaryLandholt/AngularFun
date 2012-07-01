###global define###

define ['controllers/controllers', 'services/people'], (controllers) ->
	'use strict'

	controllers.controller 'people', ['$scope', 'people', ($scope, service) ->
		$scope.error = ''
		$scope.name = ''
		$scope.people = service.people

		$scope.insertPerson = (name) ->
			service.post name
			, (Resource, getResponseHeaders) ->
				$scope.error = ''
				$scope.name = ''
			, (obj) ->
				($scope.error = obj.data) if obj.status is 403

		service.get()
	]