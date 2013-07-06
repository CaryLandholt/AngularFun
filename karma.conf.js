// list of files / patterns to load in the browser

files = [
	JASMINE,
	JASMINE_ADAPTER,

	'./src/scripts/libs/angular.js',
	'./src/scripts/libs/angular-route.js',
	'./src/scripts/libs/angular-resource.js',

	'./test/scripts/libs/angular-mocks.js',

	'./src/scripts/app.coffee',
	'./src/scripts/routes.coffee',
	'./src/scripts/run.coffee',
	'./src/scripts/views.coffee',

	'./src/scripts/controllers/**/*.coffee',
	'./src/scripts/directives/**/*.coffee',
	'./src/scripts/filters/**/*.coffee',
	'./src/scripts/interceptors/**/*.coffee',
	'./src/scripts/services/**/*.coffee',

	'./test/scripts/**/*.coffee'
];

// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_DEBUG;