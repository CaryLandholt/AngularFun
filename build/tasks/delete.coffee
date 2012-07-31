###global module, require###

module.exports = (grunt) ->
	fs = require 'fs'
	rimraf = require 'rimraf'

	deleteDirectory = (path) ->
		rimraf.sync path

	deleteFiles = (path) ->
		files = grunt.file.expandFiles path

		files.forEach (file) ->
			fs.unlinkSync file

	isDirectory = (path) ->
		isDestADirectory = true

		try
			stats = fs.statSync path
		catch error
			isDestADirectory = false

		isDestADirectory

	grunt.registerMultiTask 'delete', 'Deletes a directory', ->
		dest = @file.dest

		return if not fs.existsSync dest

		isDestADirectory = isDirectory dest

		if isDestADirectory
			deleteDirectory dest
		else
			deleteFiles dest