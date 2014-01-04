coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
gulp = require 'gulp'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
less = require 'gulp-less'
rimraf = require 'gulp-rimraf'

minifyHtml = require 'gulp-minify-html'

gulp.task 'delete', ->
	gulp.src('./.temp/')
	.pipe(rimraf())

gulp.task 'copy:temp', ['delete'], ->
	gulp.src('./src/**')
	.pipe(gulp.dest('./.temp/'))

gulp.task 'coffeelint', ['copy:temp'], ->
	options =
		arrow_spacing:
			level: 'error'
		indentation:
			value: 1
		max_line_length:
			level: 'ignore'
		no_tabs:
			level: 'ignore'

	gulp.src('./.temp/**/*.coffee')
	.pipe(coffeelint(options))
	.pipe(coffeelint.reporter())

gulp.task 'coffee', ['copy:temp'], ->
	gulp.src('./.temp/**/*.coffee')
	.pipe(coffee())
	.pipe(gulp.dest('./.temp/'))

gulp.task 'jade', ['copy:temp'], ->
	gulp.src('./.temp/**/*.jade')
	.pipe(jade(pretty: true))
	.pipe(gulp.dest('./.temp/'))

gulp.task 'minifyHtml', ['jade'], ->
	options =
		quotes: true

	gulp.src('./.temp/**/*.html')
	.pipe(minifyHtml(options))
	.pipe(gulp.dest('./.temp/'))

gulp.task 'less', ['copy:temp'], ->
	gulp.src('./.temp/styles/styles.less')
	.pipe(less())
	.pipe(gulp.dest('./.temp/styles/'))

gulp.task 'default', ->
	gulp.run 'coffee', 'less'