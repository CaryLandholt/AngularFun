###global require###

require
	map:
		'*':
			'filters/filters': '../../dist/scripts/filters/filters'
			'filters/twitterfy': '../../dist/scripts/filters/twitterfy'
			'libs/angular': '../../dist/scripts/libs/angular'
			'libs/angularMocks': 'libs/angular-mocks'
			'libs/domReady': '../../dist/scripts/libs/domReady'
			'libs/jasmineHtml': 'libs/jasmine-html'
	shim:
		'../../dist/scripts/libs/angular':
			exports: 'angular'

		'libs/angular-mocks':
			deps: [
				'libs/angular'
				'libs/jasmine-html'
			]

		'libs/jasmine':
			exports: 'jasmine'
			deps: [
				'libs/angular'
			]

		'libs/jasmine-html':
			exports: 'jasmine'
			deps: [
				'libs/jasmine'
			]
	[
		'require'
		'libs/jasmineHtml'
		'filterSpecs/twitterfySpec'
	], (require, jasmine) ->
		'use strict'

		require ['libs/domReady!'], (document) ->
			env = jasmine.getEnv()
			htmlReporter = new jasmine.HtmlReporter()

			env.addReporter htmlReporter
			env.execute()