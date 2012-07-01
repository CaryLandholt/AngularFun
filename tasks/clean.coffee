###global module, require###

module.exports = (grunt) ->
	growl = require 'growl'
	path = require 'path'
	rimraf = require 'rimraf'

	grunt.registerMultiTask 'clean', 'Deletes a directory', ->
		dest = @file.dest
		exists = path.existsSync dest

		return if not exists

		destFullPath = path.resolve dest
		message = "Deleted #{destFullPath} directory."

		rimraf.sync dest
		grunt.log.writeln message
		growl message, title: 'Directory Deleted'