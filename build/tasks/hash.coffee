###global module, require###

module.exports = (grunt) ->
	crypto = require 'crypto'
	#fs = require 'fs'

	grunt.registerMultiTask 'hash', 'Hash a file', ->
		src = @file.src
		dest = @file.dest
		source = grunt.file.read src
		hash = crypto.createHash('sha1').update(source).digest('hex')

		grunt.file.write dest, hash