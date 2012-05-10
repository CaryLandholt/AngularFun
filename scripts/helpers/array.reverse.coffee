(->
	'use strict'

	Array::clone = ->
		Array.apply null, this

	Array::sortIt = Array::sort
	Array::reverseIt = Array::reverse

	Array::sort = ->
		tmp = @clone()
		tmp.sortIt.apply tmp, arguments

	Array::reverse = ->
		tmp = @clone()
		tmp.reverseIt.apply tmp, arguments
)()