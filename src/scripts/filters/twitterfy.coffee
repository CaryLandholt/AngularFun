class TwitterfyFilter
	constructor: (@$log) ->
		return (username) ->
			"@#{username}"