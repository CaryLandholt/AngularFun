###global module, require###

module.exports = (grunt) ->
	growl = require 'growl'
	proc = require 'child_process'

	grunt.registerHelper 'exec', (opts, done) ->
		command = "#{opts.cmd} #{opts.args.join ' '}"

		proc.exec command, opts.opts, (code, stdout, stderr) ->
			return if not done

			message = "Executed command #{command}"

			grunt.log.writeln message
			growl message, title: 'Command Executed'
			done(null, stdout, code) if code is 0
			done code, stderr, code