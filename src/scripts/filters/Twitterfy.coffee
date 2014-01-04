class TwitterfyFilter
	constructor: ->
		return (username) ->
			"@#{username}"