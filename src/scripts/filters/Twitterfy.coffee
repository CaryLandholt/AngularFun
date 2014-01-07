class Twitterfy extends Filter
	constructor: ->
		return (username) ->
			"@#{username}"