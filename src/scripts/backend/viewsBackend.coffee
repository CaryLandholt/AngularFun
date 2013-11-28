class Run
	constructor: (@$log, @$httpBackend) ->
		@$httpBackend.whenGET(/^.*\.(html|htm)$/).passThrough()

angular.module('app').run ['$log', '$httpBackend', Run]