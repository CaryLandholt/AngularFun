coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
gulp = require 'gulp'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
less = require 'gulp-less'
markdown = require 'gulp-markdown'
minifyHtml = require 'gulp-minify-html'
# rename = require 'gulp-rename'
rimraf = require 'gulp-rimraf'
template = require 'gulp-template'
# uglify = require 'gulp-uglify'

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

# .pipe(rename (dir, base, ext) ->
# "#{base}.html"
# )

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

gulp.task 'default', ->
	gulp.run('scripts', 'styles', 'views')




