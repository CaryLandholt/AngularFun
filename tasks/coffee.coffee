###global module, require###

module.exports = (grunt) ->
	coffeeScript = require 'coffee-script'
	growl = require 'growl'
	path = require 'path'

	handleResult = (src, dest, err, stdout, code, done) ->
		srcFullPath = path.resolve src
		destFullPath = path.resolve dest

		if err
			message = "Failed to compile #{srcFullPath} to #{destFullPath}.\n\n#{stdout}"

			grunt.log.writeln message
			growl message, title: 'CoffeeScript Compile Error', sticky: true
			done false

			return

		message = "Compiled #{srcFullPath} to #{destFullPath}."

		grunt.log.writeln message
		growl message, title: 'CoffeeScript Compiled'
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