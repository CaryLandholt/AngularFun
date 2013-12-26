class TwitterfyFilter
	constructor: (@$log) ->
		return (username) ->
			"@#{username}"

angular.module('app').filter 'twitterfy', ['$log', TwitterfyFilter]