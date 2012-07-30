###global module, require###

module.exports = (grunt) ->
	wrench = require 'wrench'

	grunt.registerMultiTask 'copy', 'Copies a directory', ->
		src = @file.src
		dest = @file.dest

		wrench.mkdirSyncRecursive dest, 0o0777
		wrench.copyDirSyncRecursive src, dest