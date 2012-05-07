###global define###

define ['filters/filters'], (filters) ->
	'use strict'

	filter = (username) ->
		"@#{username}"

	filters.filter 'twitterfy', [-> filter]

	filter