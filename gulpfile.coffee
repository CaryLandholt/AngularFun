coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
gulp = require 'gulp'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
less = require 'gulp-less'
markdown = require 'gulp-markdown'
minifyHtml = require 'gulp-minify-html'
path = require 'path'
# rename = require 'gulp-rename'
rimraf = require 'gulp-rimraf'

gulp.task 'delete', ->
	gulp.src('./.temp/')
		.pipe(rimraf())

gulp.task 'copy:temp', ['delete'], ->
	gulp.src('./src/**')
		.pipe(gulp.dest('./.temp/'))

gulp.task 'coffeelint', ->
	options =
		arrow_spacing:
			level: 'error'
		indentation:
			value: 1
		max_line_length:
			level: 'ignore'
		no_tabs:
			level: 'ignore'

	gulp.src('./src/**/*.coffee')
		.pipe(coffeelint(options))
		.pipe(coffeelint.reporter())

gulp.task 'coffee', ['coffeelint', 'copy:temp'], ->
	gulp.src('./.temp/**/*.coffee')
		.pipe(coffee())
		.pipe(gulp.dest('./.temp/'))

gulp.task 'jade', ['copy:temp'], ->
	gulp.src('./.temp/**/*.jade')
		.pipe(jade(pretty: true))
		.pipe(gulp.dest('./.temp/'))

gulp.task 'markdown', ['copy:temp'], ->
	gulp.src('./.temp/**/*.md')
		.pipe(markdown())
		.pipe(gulp.dest('./.temp/'))

gulp.task 'minifyHtml', ['jade', 'markdown'], ->
	options =
		quotes: true

	gulp.src('./.temp/**/*.html')
		.pipe(minifyHtml(options).on('error', gutil.log))
		.pipe(gulp.dest('./.temp/'))

gulp.task 'less', ['copy:temp'], ->
	gulp.src('./.temp/styles/styles.less')
		.pipe(less())
		.pipe(gulp.dest('./.temp/styles/'))

gulp.task 'default', ->
	gulp.run('coffee', 'less', 'minifyHtml')