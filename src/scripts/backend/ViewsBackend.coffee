class ViewsBackendRun
	constructor: ($httpBackend) ->
		$httpBackend.whenGET(/^.*\.(html|htm)$/).passThrough()