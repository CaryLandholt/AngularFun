###global define###

define ['filters/filters'], (filters) ->
	'use strict'

	filters.filter 'twitterfy', [-> (username) ->
		"@#{username}"
	]