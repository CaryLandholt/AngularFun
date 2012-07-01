###global define###

define ['require', 'libs/angular', 'app'], (require, angular) ->
	'use strict'

	require ['libs/domReady!'], (document) ->
		angular.bootstrap document, ['app']