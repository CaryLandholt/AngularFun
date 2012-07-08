###global module, require###

module.exports = (grunt) ->
	removeNonPrintableCharacters = (content) ->
		# tabs and newlines
		pattern = /(\t|\r\n|\n|\r)/gm

		content.replace pattern, ''

	grunt.registerMultiTask 'template', 'Compiles a template', ->
		src = @file.src
		dest = @file.dest
		source = grunt.file.read src
		config = {config: @data}
		compiled = grunt.template.process source, config

		grunt.file.write dest, compiled