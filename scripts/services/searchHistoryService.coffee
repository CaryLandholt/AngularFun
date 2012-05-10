###global define###

define ['services/services'], (services) ->
	'use strict'

	searchHistory = []

	services.factory 'searchHistoryService', [->
		searchHistory: searchHistory
	]