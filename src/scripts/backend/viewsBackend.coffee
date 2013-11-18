class Run
	constructor: ($log, $httpBackend) ->
		$httpBackend.whenGET(/^\/views\//).passThrough()

angular.module('app').run ['$log', '$httpBackend', Run]