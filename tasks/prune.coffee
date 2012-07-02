###global module, require###

module.exports = (grunt) ->
	fs = require 'fs'
	growl = require 'growl'
	path = require 'path'

	grunt.registerMultiTask 'prune', 'Deletes files', ->
		src = @file.src
		files = grunt.file.expandFiles src

		files.forEach (file) ->
			fs.unlinkSync file
			
