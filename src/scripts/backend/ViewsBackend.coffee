class ViewsBackend extends Run
	constructor: ($httpBackend) ->
		$httpBackend.whenGET(/^.*\.(html|htm)$/).passThrough()