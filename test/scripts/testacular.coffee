###global require###

require
	map:
		'*':
			'filters/filters': 'dist/scripts/filters/filters'
			'filters/twitterfy': 'dist/scripts/filters/twitterfy'
			'services/services': 'dist/scripts/services/services'
			'services/personService': 'dist/scripts/services/personService'
			'libs/angular': 'dist/scripts/libs/angular'
			'libs/angularResource': 'dist/scripts/libs/angular-resource'
			'libs/angularMocks': 'test/scripts/libs/angular-mocks'
	shim:
		'dist/scripts/libs/angular':
			exports: 'angular'

		'dist/scripts/libs/angular-resource':
			deps: [
				'dist/scripts/libs/angular'
			]

		'test/scripts/libs/angular-mocks':
			deps: [
				'dist/scripts/libs/angular'
			]

	[
		'test/scripts/services/personSpec'
		'test/scripts/filterSpecs/twitterfySpec'
	], () ->
		window.__testacular__.start()