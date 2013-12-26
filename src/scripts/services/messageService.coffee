class MessageService
	constructor: (@$log, @$rootScope) ->

	publish: (name, parameters) ->
		params = angular.extend {}, parameters,
			timeStamp: Date.now()

		@$rootScope.$broadcast name, params

	subscribe: (name, listener) ->
		@$rootScope.$on name, listener