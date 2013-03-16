// list of files / patterns to load in the browser
files = [
	JASMINE,
	JASMINE_ADAPTER,
	'./dist/scripts/libs/angular.js',
	'./dist/scripts/libs/angular-resource.js',
	'./test/scripts/libs/angular-mocks.js',
	'./dist/scripts/app.js',
	'./dist/scripts/controllers/*.js',
	'./dist/scripts/directives/*.js',
	'./dist/scripts/filters/*.js',
	'./dist/scripts/responseInterceptors/*.js',
	'./dist/scripts/services/*.js',

	'./dist_test/scripts/filters/*.js',
	'./dist_test/scripts/services/*.js'
];

// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;