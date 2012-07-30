###global module, require###

module.exports = (grunt) ->
	coffeeScript = require 'coffee-script'

	grunt.registerMultiTask 'coffee', 'Compile CoffeeScript to JavaScript', ->
		src = @file.src
		dest = @file.dest
		bare = not not @data.bare

		options = [
			'./node_modules/.bin/coffee'
			'--compile'
			'--bare' if bare
			'--output'
			dest
			src
		]

		grunt.helper 'exec', "#{options.join ' '}", true, true, (err) ->
			grunt.log.write(err) if err