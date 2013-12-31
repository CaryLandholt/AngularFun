class ViewsBackendRun
	constructor: (@$log, @$httpBackend) ->
		@$httpBackend.whenGET(/^.*\.(html|htm)$/).passThrough()