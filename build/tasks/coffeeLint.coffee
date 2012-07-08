###global module, require###

module.exports = (grunt) ->
	coffeeLint = require 'coffeelint'
	path = require 'path'

	grunt.registerMultiTask 'coffeeLint', 'Lints CoffeeScript files', ->
		src = @file.src
		config = @data
		files = grunt.file.expandFiles src
		message = ''

		files.forEach (file, index) ->
			source = grunt.file.read file
			errors = coffeeLint.lint source, config

			return if not errors.length

			fullPath = path.resolve file
			message += "#{fullPath}\n"

			errors.forEach (error) ->
				message += "##{error.lineNumber}: #{error.message}\n"

			message += '\n'

		return if not message.length

		grunt.log.writeln message