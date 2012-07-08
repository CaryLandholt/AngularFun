###global module, require###

module.exports = (grunt) ->
	fs = require 'fs'
	less = require 'less'
	path = require 'path'

	grunt.registerHelper 'less', (srcFiles, options, compress, callback) ->
		compileLessFile = (src, callback) ->
			parser = new less.Parser {
				paths: [path.dirname src]
			}

			fs.readFile src, 'utf8', (err, data) ->
				callback err if err

				parser.parse data, (err, tree) ->
					callback err if err

					css = null

					try
					  css = tree.toCSS compress: compress
					catch e
						return callback e

					callback null, css

		grunt.utils.async.map srcFiles, compileLessFile, (err, results) ->
			return callback err if err

			callback null, results.join grunt.utils.linefeed

	grunt.registerMultiTask 'less', 'Compile LESS to CSS', ->
		done = @async()
		src = @file.src
		dest = @file.dest
		options = @data.options
		srcFiles = grunt.file.expandFiles src
		config = @data
		compress = @data.compress ? false

		grunt.helper 'less', srcFiles, options, compress, (err, css) ->
			if err
				grunt.warn err
				done false

				return

			grunt.file.write dest, css
			done()