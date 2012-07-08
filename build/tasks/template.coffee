###global module, require###

module.exports = (grunt) ->
	Beautifier = require 'node-js-beautify'

	removeNonPrintableCharacters = (content) ->
		# tabs and newlines
		pattern = /(\t|\r\n|\n|\r)/gm

		content.replace pattern, ''

	grunt.registerMultiTask 'template', 'Compiles a template', ->
		src = @file.src
		dest = @file.dest
		source = grunt.file.read src
		data = @data
		minify = not not data.minify
		config = {config: data}
		compiled = grunt.template.process source, config
		beautifier = new Beautifier()

		if minify
			compiled = removeNonPrintableCharacters compiled
		else
			compiled = beautifier.beautify_html compiled,
				indent_size: 1
				indent_char: '\t'
				max_char: 1000

		grunt.file.write dest, compiled