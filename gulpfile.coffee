coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
es = require 'event-stream'
gulp = require 'gulp'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
less = require 'gulp-less'
markdown = require 'gulp-markdown'
minifyHtml = require 'gulp-minify-html'
rimraf = require 'gulp-rimraf'
template = require 'gulp-template'

bower = (opts) ->
	es.through ->
		require('bower').commands
			.install([], opts)

gulp.task 'bower', ->
	gulp.src('')
		.pipe(bower())

gulp.task 'clean', ->
	gulp.src('./.temp/')
		.pipe(rimraf())

gulp.task 'copy:temp', ->
	gulp.src('./src/**')
		.pipe(gulp.dest('./.temp/'))

	gulp.src([
		'./bower_components/angular/angular.min.js'
		'./bower_components/angular-animate/angular-animate.min.js'
		'./bower_components/angular-mocks/angular-mocks.js'
		'./bower_components/angular-route/angular-route.min.js'
		'./bower_components/html5shiv/dist/html5shiv-printshiv.js'
		'./bower_components/json3/lib/json3.min.js'
	])
	.pipe(gulp.dest('./.temp/scripts/libs/'))

	gulp.src('./bower_components/bootstrap/less/**/*.less')
	.pipe(gulp.dest('./.temp/styles/'))

	gulp.src('./bower_components/bootstrap/dist/fonts/**/*.{eot,svg,ttf,woff}')
	.pipe(gulp.dest('./.temp/fonts/'))

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

gulp.task 'coffee', ['coffeelint'], ->
	gulp.src('./.temp/**/*.coffee')
		.pipe(coffee())
		.pipe(gulp.dest('./.temp/'))

# gulp.task 'uglify', ['scripts'], ->
# 	gulp.src('./.temp/**/*.js')
# 		.pipe(uglify())
# 		.pipe(gulp.dest('./.temp/scripts/scripts.min.js'))

gulp.task 'jade', ['template'], ->
	gulp.src('./.temp/**/*.jade')
		.pipe(jade(pretty: true))
		.pipe(gulp.dest('./.temp/'))

gulp.task 'markdown', ['template'], ->
	gulp.src('./.temp/**/*.md')
		.pipe(markdown())
		.pipe(gulp.dest('./.temp/'))

gulp.task 'views', ->
	gulp.run('minifyHtml')

gulp.task 'scripts', ->
	gulp.run('coffee')

gulp.task 'styles', ->
	gulp.run('less')

gulp.task 'template', ['copy:temp'], ->
	data =
		scripts: '<!-- my scripts -->'
		styles: '<!-- my styles -->'

	gulp.src('./.temp/**/*.{html,jade,md}')
		.pipe(template(data))
		.pipe(gulp.dest('./.temp/'))

gulp.task 'minifyHtml', ['jade', 'markdown'], ->
	options =
		quotes: true

	gulp.src('./.temp/**/*.html')
		.pipe(minifyHtml(options))
		.pipe(gulp.dest('./.temp/'))

gulp.task 'less', ['copy:temp'], ->
	gulp.src('./.temp/styles/styles.less')
		.pipe(less())
		.pipe(gulp.dest('./.temp/styles/'))

gulp.task 'default', ['clean'], ->
	gulp.run('scripts', 'styles', 'views')




