###global module, require###

module.exports = (grunt) ->
	requirejs = require 'requirejs'

	grunt.registerMultiTask 'requirejs', 'Runs the RequireJS Optimizer', ->
		config = @data
		hashPath = config.hash

		if hashPath
			hash = grunt.file.read hashPath
			path = config.out.replace '{hash}', hash
			config.out = path

		requirejs.optimize config, (buildResponse) ->
			grunt.verbose.writeln buildResponse