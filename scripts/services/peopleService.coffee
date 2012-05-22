###global define###

define ['services/services'], (services) ->
	'use strict'

	people = {}

	services.factory 'peopleService', ['$resource', ($resource) ->
		activity = $resource './members',
			{
				callback: 'JSON_CALLBACK'
			}
			{
				get:
					method: 'GET'
					isArray: true
				post:
					method: 'POST'
					isArray: true
				put:
					method: 'PUT'
					isArray: true
			}

		people: people

		get: ->
			people = activity.get (Resource, getResponseHeaders) ->
				console.log 'success', Resource, getResponseHeaders()
			, (obj) ->
				console.log 'error', obj.config, obj.headers(), obj.status

		post: ->
			people = activity.post "name": "Somebody else", (Resource, getResponseHeaders) ->
				console.log 'success', Resource, getResponseHeaders()
			, (obj) ->
				console.log 'error', obj.config, obj.headers(), obj.status, obj.data
	]