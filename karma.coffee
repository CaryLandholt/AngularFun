module.exports = (config) ->
	config.set
		files: [
			'./dist/scripts/libs/angular.js'
			'./dist/scripts/libs/angular-animate.js'
			'./dist/scripts/libs/angular-route.js'
			'./dist/scripts/libs/angular-resource.js'

			'./bower_components/angular-mocks/angular-mocks.js'

			'./dist/scripts/app.js'
			'./dist/scripts/routes.js'
			'./dist/scripts/run.js'
			'./dist/scripts/views.js'

			'./dist/scripts/controllers/**/*.js'
			'./dist/scripts/directives/**/*.js'
			'./dist/scripts/filters/**/*.js'
			'./dist/scripts/interceptors/**/*.js'
			'./dist/scripts/services/**/*.js'

			'./test/scripts/**/*.{coffee,js}'
		]