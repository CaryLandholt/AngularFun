###global module, require###

module.exports = (grunt) ->
	growl = require 'growl'
	path = require 'path'
	requirejs = require 'requirejs'

	grunt.registerMultiTask 'requirejs', 'Builds RequireJS modules via the RequireJS Optimizer', ->
		config = @data
		dest = config.out
		destFullPath = path.resolve dest

		requirejs.optimize config, (buildResponse) ->
			message = "Optimized #{buildResponse}"

			grunt.log.writeln message
			growl message, title: 'Optimized JavaScript'