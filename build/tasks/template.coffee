###global module, require###

module.exports = (grunt) ->
	Beautifier = require 'node-js-beautify'
	fs = require 'fs'
	path = require 'path'

	removeNonPrintableCharacters = (content) ->
		# tabs and newlines
		pattern = /(\t|\r\n|\n|\r)/gm

		content.replace pattern, ''

	grunt.registerMultiTask 'template', 'Compiles a template', ->
		src = @file.src
		dest = @file.dest
		files = grunt.file.expandFiles src
		srcDir = path.dirname src.replace '**', ''
		config = @data
		ext = config.ext ? '.html'
		minify = config.minify ? false
		beautifier = new Beautifier()
		config.include = grunt.file.read

		files.forEach (file) ->
			source = grunt.file.read file
			fileExt = path.extname file
			relative = path.relative srcDir, file
			destPath = path.resolve(dest, relative).replace fileExt, ext
			compiled = grunt.template.process source, config: config

			if minify
				compiled = removeNonPrintableCharacters compiled
			else
				compiled = beautifier.beautify_html compiled, config

			grunt.file.write destPath, compiled