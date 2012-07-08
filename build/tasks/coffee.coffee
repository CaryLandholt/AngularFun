###global module, require###

module.exports = (grunt) ->
	coffeeScript = require 'coffee-script'
	path = require 'path'

	handleResult = (src, dest, err, stdout, code, done) ->
		srcFullPath = path.resolve src
		destFullPath = path.resolve dest

		if err
			done false

			return

		done true

	grunt.registerMultiTask 'coffee', 'Compile CoffeeScript to JavaScript', ->
		done = @async()
		src = @file.src
		dest = @file.dest
		bare = not not @data.bare

		options =
			cmd: 'coffee'
			args: [
				'--compile'
				'--bare' if bare
				'--output'
				dest
				src
			]

		grunt.helper 'exec', options, (err, stdout, code) ->
			handleResult src, dest, err, stdout, code, done