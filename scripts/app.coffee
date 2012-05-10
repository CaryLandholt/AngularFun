###global define###

define [
	'use!angular'
	'controllers/controllers'
	'directives/directives'
	'filters/filters'
	'services/services'
	], (angular) ->
	'use strict'

	angular.module 'app', [
		'controllers'
		'directives'
		'filters'
		'services'
	]