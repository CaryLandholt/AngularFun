###global module, require###

module.exports = (grunt) ->
	growl = require 'growl'
	path = require 'path'
	rimraf = require 'rimraf'

	removeNonPrintableCharacters = (content) ->
		# tabs and newlines
		pattern = /(\t|\r\n|\n|\r)/gm

		content.replace pattern, ''

	grunt.registerMultiTask 'template', 'Compiles a template', ->
		src = @file.src
		source = grunt.file.read src
		config = @data

		for key, template of config.includes
			content = grunt.file.read template
			config.includes[key] = removeNonPrintableCharacters content

		compiled = grunt.template.process source, config
		
		grunt.file.write src, compiled


		#compiled = grunt.template.process source, config

		#grunt.file.write src, compiled


		#scripts = config.scripts
		#scriptsTemplate = grunt.file.read scripts
		#styles = config.styles
		#stylesTemplate = grunt.file.read styles

		###
		environment = config.environment

		obj =
			scripts: scriptsTemplate
			styles: stylesTemplate
			environment: environment

		compiled = grunt.template.process source, obj

		grunt.file.write src, compiled
		###