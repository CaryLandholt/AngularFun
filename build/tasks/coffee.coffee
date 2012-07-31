###global module, require###

module.exports = (grunt) ->
	coffeeScript = require 'coffee-script'

	grunt.registerMultiTask 'coffee', 'Compile CoffeeScript to JavaScript', ->
		done = @async()
		src = @file.src
		dest = @file.dest
		bare = @data.bare ? false

		options = [
			'"' + './node_modules/.bin/coffee' + '"'
			'--compile'
			'--bare' if bare
			'--output'
			dest
			src
		]

		grunt.helper 'exec', "#{options.join ' '}", true, true, (err) ->
			if err
				grunt.log.write err
				done false
			else
				done true