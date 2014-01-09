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
	es.map (file, cb) ->
		require('bower').commands
			.install([], opts)
			.on 'end', ->
				cb(null, file)

gulp.task 'clean:bower', ->
	gulp.src('./bower_components/')
		.pipe(rimraf())

gulp.task 'bower', ['clean:bower'], ->
	gulp.src('')
		.pipe(bower())

gulp.task 'clean:temp', ->
	gulp.src('./.temp/')
		.pipe(rimraf())

gulp.task 'copy:temp', ['clean:temp'], ->
	gulp.src('./src/**')
		.pipe(gulp.dest('./.temp/'))

	gulp.src([
		'./bower_components/angular/angular.min.js'
		'./bower_components/angular-animate/angular-animate.min.js'
		'./bower_components/angular-mocks/angular-mocks.js'
		'./bower_components/angular-route/angular-route.min.js'
		'./bower_components/html5shiv/dist/html5shiv-printshiv.js'
		'./bower_components/json3/lib/json3.min.js'
		'./bower_components/requirejs/require.js'
	])
	.pipe(gulp.dest('./.temp/scripts/libs/'))

	gulp.src('./bower_components/bootstrap/less/**/*.less')
	.pipe(gulp.dest('./.temp/styles/'))

	gulp.src('./bower_components/bootstrap/dist/fonts/**/*.{eot,svg,ttf,woff}')
	.pipe(gulp.dest('./.temp/fonts/'))

gulp.task 'copy:dev', ->
	gulp.src('./.temp/**')
		.pipe(gulp.dest('./dist/'))

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

gulp.task 'scripts', ->
	gulp.run('coffee')

gulp.task 'less', ->
	gulp.src('./.temp/styles/styles.less')
		.pipe(less())
		.pipe(gulp.dest('./.temp/styles/'))

gulp.task 'styles', ->
	gulp.run('less')

gulp.task 'template', ->
	data =
		scripts: '<script data-main="/scripts/main.js" src="/scripts/libs/require.js"></script>'
		styles: '<!--[if lte IE 8]> <script src="/scripts/libs/json3.js"></script> <script src="/scripts/libs/html5shiv-printshiv.js"></script> <![endif]--><link rel="stylesheet" href="/styles/styles.css" />'

	gulp.src('./.temp/**/*.{html,jade,md,markdown}')
		.pipe(template(data))
		.pipe(gulp.dest('./.temp/'))

gulp.task 'jade', ['template'], ->
	gulp.src('./.temp/**/*.jade')
		.pipe(jade(pretty: true))
		.pipe(gulp.dest('./.temp/'))

gulp.task 'markdown', ['template'], ->
	gulp.src('./.temp/**/*.{md,markdown}')
		.pipe(markdown())
		.pipe(gulp.dest('./.temp/'))

gulp.task 'views', ->
	gulp.run('jade', 'markdown')

gulp.task 'build', ['copy:temp'], ->
	gulp.run('scripts', 'styles', 'views')

gulp.task 'default', ['build'], ->
	gulp.run('copy:dev')

gulp.task 'init', ['bower'], ->
	gulp.run('default')






# gulp.task 'uglify', ['scripts'], ->
# 	gulp.src('./.temp/**/*.js')
# 		.pipe(uglify())
# 		.pipe(gulp.dest('./.temp/scripts/scripts.min.js'))











gulp.task 'minifyHtml', ['jade', 'markdown'], ->
	options =
		quotes: true

	gulp.src('./.temp/**/*.html')
		.pipe(minifyHtml(options))
		.pipe(gulp.dest('./.temp/'))








