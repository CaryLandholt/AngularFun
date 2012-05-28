###global define###

define [
	'libs/angular'
	'controllers/controllers'
	'directives/directives'
	'filters/filters'
	'libs/angular-resource'
	'responseInterceptors/responseInterceptors'
	'services/services'
	], (angular) ->
	'use strict'

	angular.module 'app', [
		'ngResource'
		'controllers'
		'directives'
		'filters'
		'responseInterceptors'
		'services'
	]