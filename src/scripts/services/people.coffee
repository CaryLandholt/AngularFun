###global define###

define ['libs/angular', 'services/services', 'libs/angularResource'], (angular, services) ->
	'use strict'

	services.factory 'people', ['$resource', ($resource) ->
		people = result: []
		person = result: {}

		activity = $resource './people', {},
			get:
				method: 'GET'
				isArray: true
			post:
				method: 'POST'

		personActivity = $resource './people/:id', {},
			get:
				method: 'GET'
				isArray: false

		get = (success, failure) ->
			people.result = activity.get ->
				success.apply(this, arguments) if angular.isFunction success
			, ->
				failure.apply(this, arguments) if angular.isFunction failure

		post = (name = "Somebody else", success, failure) ->
			activity.post "name": name
			, (person) ->
				people.result.push person

				success.apply(this, arguments) if angular.isFunction success
			, failure

		getPerson = (id, success, failure) ->
			person.result = personActivity.get {id: id}, ->
				success.apply(this, arguments) if angular.isFunction success
			, ->
				failure.apply(this, arguments) if angular.isFunction failure

		get: get
		people: people
		post: post
		person: person
		getPerson: getPerson
	]