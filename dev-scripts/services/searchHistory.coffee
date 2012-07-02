###global define###

define ['services/services'], (services) ->
	'use strict'

	services.factory 'searchHistory', [->
		searchHistory: []
	]