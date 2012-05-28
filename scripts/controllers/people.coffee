###global define###

define ['controllers/controllers', 'services/people'], (controllers) ->
	'use strict'

	controllers.controller 'people', ['$scope', 'people', '$log', ($scope, service, $log) ->
		$scope.people = service.people

		$scope.insertPerson = ->
			service.post()

		service.get (Resource, getResponseHeaders) ->
			return
			#$log.info 'people.get success', Resource, getResponseHeaders()
		, (obj) ->
			return
			#$log.error 'people.get error', obj.config, obj.headers(), obj.status, obj.data
	]