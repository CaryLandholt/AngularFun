angular.module('app').service 'personService', ['$log', '$q', '$resource', ($log, $q, $resource) ->
	self = @
	activity = $resource './people/:id'

	get = ->
		defer = $q.defer()

		activity.query {}, (results) ->
			defer.resolve results.data
		, (results) ->
			$log.error 'personService.query error', results
			defer.reject results

		defer.promise

	getPerson = (id) ->
		defer = $q.defer()

		activity.get {id}, (results) ->
			defer.resolve results.data
		, (results) ->
			$log.error 'personService.get error', results
			defer.reject results

		defer.promise

	save = (person) ->
		defer = $q.defer()
		newPerson = new activity person

		activity.$save (results) ->
			defer.resolve results.data
		, (results) ->
			$log.error 'personService.save error', results
			defer.reject results

		defer.promise




		# newPerson = new activity person

		# newPerson.$save (newPerson, getResponseHeaders) ->
		# 	success(newPerson) if angular.isFunction success
		# , failure

	self.get = get
	self.getPerson = getPerson
	self.save = save
]