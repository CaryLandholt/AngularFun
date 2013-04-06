angular.module('app').service 'personService', ['$log', '$resource', ($log, $resource) ->
	self = @
	activity = $resource './people/:id'

	get = (success, failure) ->
		activity.query {}
		, (people, getResponseHeaders) ->
			success(people) if angular.isFunction success
		, failure

	getPerson = (id, success, failure) ->
		activity.get {id: id}
		, (person, getResponseHeaders) ->
			success(person) if angular.isFunction success
		, failure

	save = (person, success, failure) ->
		newPerson = new activity person

		newPerson.$save (newPerson, getResponseHeaders) ->
			success(newPerson) if angular.isFunction success
		, failure

	self.get = get
	self.getPerson = getPerson
	self.save = save
]