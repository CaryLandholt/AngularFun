###global require###

require
	map:
		'*':
			'filters/twitterfy': 'dist/scripts/filters/twitterfy'
			'services/personService': 'dist/scripts/services/personService'
			'libs/angular': 'dist/scripts/libs/angular'
			'libs/angular-resource': 'dist/scripts/libs/angular-resource'
			'libs/angularMocks': 'test/scripts/libs/angular-mocks'
	shim:
		'dist/scripts/libs/angular-resource': deps: ['dist/scripts/libs/angular']
		'test/scripts/libs/angular-mocks': deps: ['dist/scripts/libs/angular']
		'dist/scripts/services/personService': deps: ['dist/scripts/libs/angular', 'dist/scripts/app', 'dist/scripts/libs/angular-resource']
		'dist/scripts/filters/twitterfy': deps: ['dist/scripts/libs/angular', 'dist/scripts/app']
		'dist/scripts/app': deps: ['dist/scripts/libs/angular', 'dist/scripts/libs/angular-resource']
	[
		'test/scripts/services/personSpec'
		'test/scripts/filterSpecs/twitterfySpec'
	], () ->
		window.__testacular__.start()