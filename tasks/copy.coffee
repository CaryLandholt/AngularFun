###global module, require###

module.exports = (grunt) ->
	growl = require 'growl'
	path = require 'path'
	wrench = require 'wrench'

	grunt.registerMultiTask 'copy', 'Copies a directory', ->
		src = @file.src
		dest = @file.dest
		exists = path.existsSync src

		return if not exists

		srcFullPath = path.resolve src
		destFullPath = path.resolve dest
		message = "Copied #{srcFullPath} to #{destFullPath}."

		wrench.copyDirSyncRecursive src, dest
		grunt.log.writeln message
		growl message, title: 'Directory Copied'