###global module, require###

module.exports = (grunt) ->
	fs = require 'fs'
	rimraf = require 'rimraf'

	deleteDirectory = (dest) ->
		rimraf.sync dest

	deleteFiles = (dest) ->
		files = grunt.file.expandFiles dest

		files.forEach (file) ->
			fs.unlinkSync file

	isDirectory = (dest) ->
		isDestADirectory = true

		try
			stats = fs.statSync dest
		catch error
			isDestADirectory = false

		isDestADirectory

	grunt.registerMultiTask 'delete', 'Deletes a directory', ->
		dest = @file.dest
		isDestADirectory = isDirectory dest

		if isDestADirectory
			deleteDirectory dest
		else
			deleteFiles dest