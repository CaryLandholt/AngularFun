# list of files / patterns to load in the browser
files = [
	JASMINE
	JASMINE_ADAPTER

	'./src/scripts/libs/angular.js'
	'./src/scripts/libs/angular-route.js'
	'./src/scripts/libs/angular-resource.js'

	'./test/scripts/libs/angular-mocks.js'

	'./src/scripts/app.{coffee,js}'
	'./src/scripts/routes.{coffee,js}'
	'./src/scripts/run.{coffee,js}'
	'./src/scripts/views.{coffee,js}'

	'./src/scripts/controllers/**/*.{coffee,js}'
	'./src/scripts/directives/**/*.{coffee,js}'
	'./src/scripts/filters/**/*.{coffee,js}'
	'./src/scripts/interceptors/**/*.{coffee,js}'
	'./src/scripts/services/**/*.{coffee,js}'

	'./test/scripts/**/*.{coffee,js}'
]

# level of logging
# possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_DEBUG