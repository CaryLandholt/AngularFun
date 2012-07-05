###global module, require###

module.exports = (grunt) ->
	growl = require 'growl'
	path = require 'path'
	wrench = require 'wrench'
	fs = require 'fs'

	grunt.registerMultiTask 'copyFile', 'Copies a file', ->
		src = @file.src
		dest = @file.dest
		source = grunt.file.read src

		grunt.file.write dest, source