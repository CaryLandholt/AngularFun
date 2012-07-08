###global module, require###

module.exports = (grunt) ->
	fs = require 'fs'
	wrench = require 'wrench'

	grunt.registerMultiTask 'copy', 'Copies a directory', ->
		src = @file.src
		dest = @file.dest
		exists = fs.existsSync src

		return if not exists

		wrench.mkdirSyncRecursive dest, 0o0777
		wrench.copyDirSyncRecursive src, dest