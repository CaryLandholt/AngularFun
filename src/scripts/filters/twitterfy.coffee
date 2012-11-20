###global define###

define ['filters/filters'], (filters) ->
	'use strict'

	filters.filter 'twitterfy', ['$log', ($log) -> (username) ->
		"@#{username}"
	]