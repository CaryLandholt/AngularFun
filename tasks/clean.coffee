###global module, require###

module.exports = (grunt) ->
	growl = require 'growl'
	path = require 'path'
	rimraf = require 'rimraf'

	grunt.registerMultiTask 'clean', 'Deletes a directory', ->
		src = @file.src
		exists = path.existsSync src

		return if not exists

		srcFullPath = path.resolve src
		message = "Deleted #{srcFullPath} directory."

		rimraf.sync src
		grunt.log.writeln message
		growl message, title: 'Directory Deleted'