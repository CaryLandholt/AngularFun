class Run
	constructor: (@$log, @$httpBackend) ->
		@$httpBackend.whenJSONP(/api.github.com/).passThrough()

angular.module('app').run ['$log', '$httpBackend', Run]