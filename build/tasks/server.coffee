###global module, require###

module.exports = (grunt) ->
	grunt.registerMultiTask 'server', 'Run a server', ->
		done = @async()
		src = @file.src
		target = @target
		config = @data
		watch = config.watch ? false
		port = config.port

		if watch
			options = [
				'"' + './node_modules/.bin/nodemon' + '"'
				src
				'-w'
				src
				port
			]
		else
			options = [
				'node'
				src
				port
			]

		grunt.log.write "starting \"#{target}\" web server at \"http://localhost:#{port}\""

		grunt.helper 'exec', "#{options.join ' '}", true, true, (err) ->
			if err
				grunt.log.write err
				done false
			else
				done true