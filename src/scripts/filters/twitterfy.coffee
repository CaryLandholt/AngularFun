class Filter
	constructor: (@$log) ->
		return (username) ->
			"@#{username}"

angular.module('app').filter 'twitterfy', ['$log', Filter]