path = require 'path'

# Build configurations.
module.exports = (grunt) ->
	grunt.initConfig
		# Deletes dist and temp directories.
		# The temp directory is used during the build process.
		# The dist directory contains the artifacts of the build.
		# These directories should be deleted before subsequent builds.
		# These directories are not committed to source control.
		clean:
			working:
				src: [
					'./dist/'
					'./dist_test/'
					'./.temp/'
				]
			# Used for those that desire plain old JavaScript.
			jslove:
				src: [
					'**/*.coffee'
					'!**/node_modules/**'
				]

		# Compile CoffeeScript (.coffee) files to JavaScript (.js).
		coffee:
			scripts:
				files: [
					cwd: './src/'
					src: 'scripts/**/*.coffee'
					dest: './.temp/'
					expand: true
					ext: '.js'
				,
					cwd: './test/'
					src: 'scripts/**/*.coffee'
					dest: './dist_test/'
					expand: true
					ext: '.js'
				]
				options:
					# Don't include a surrounding Immediately-Invoked Function Expression (IIFE) in the compiled output.
					# For more information on IIFEs, please visit http://benalman.com/news/2010/11/immediately-invoked-function-expression/
					bare: true
			# Used for those that desire plain old JavaScript.
			jslove:
				files: [
					cwd: './'
					src: [
						'**/*.coffee'
						'!**/node_modules/**'
					]
					dest: './'
					expand: true
					ext: '.js'
				]
				options: '<%= coffee.scripts.options %>'

		# Copies directories and files from one location to another.
		copy:
			# Copies the contents of the temp directory, except views, to the dist directory.
			# In 'dev' individual files are used.
			dev:
				files: [
					cwd: './.temp/'
					src: '**'
					dest: './dist/'
					expand: true
				]
			# Copies img directory to temp.
			img:
				files: [
					cwd: './src/'
					src: 'img/**/*.png'
					dest: './.temp/'
					expand: true
				]
			# Copies js files to the temp directory
			js:
				files: [
					cwd: './src/'
					src: 'scripts/**/*.js'
					dest: './.temp/'
					expand: true
				,
					cwd: './src/'
					src: 'scripts/**/*.js'
					dest: './dist_test/'
					expand: true
				]
			# Copies select files from the temp directory to the dist directory.
			# In 'prod' minified files are used along with img and libs.
			# The dist artifacts contain only the files necessary to run the application.
			prod:
				files: [
					cwd: './.temp/'
					src: [
						'img/**/*.png'
						'scripts/libs/html5shiv-printshiv.js'
						'scripts/libs/json2.js'
						'scripts/scripts.min.js'
						'styles/styles.min.css'
					]
					dest: './dist/'
					expand: true
				,
					'./dist/index.html': './.temp/index.min.html'
				]
			# Task is run when the watched index.template file is modified.
			index:
				files: [
					cwd: './.temp/'
					src: 'index.html'
					dest: './dist/'
					expand: true
				]
			# Task is run when a watched script is modified.
			scripts:
				files: [
					cwd: './.temp/'
					src: 'scripts/**'
					dest: './dist/'
					expand: true
				]
			# Task is run when a watched style is modified.
			styles:
				files: [
					cwd: './.temp/'
					src: 'styles/**'
					dest: './dist/'
					expand: true
				]
			# Task is run when a watched view is modified.
			views:
				files: [
					cwd: './.temp/'
					src: 'views/**'
					dest: './dist/'
					expand: true
				]

		# Start an Express server + live reload.
		express:
			livereload:
				options:
					port: 3005
					bases: path.resolve './dist'
					debug: true
					monitor: {}
					server: path.resolve './server'

		# Compresses png files
		imagemin:
			img:
				files: [
					cwd: './src/'
					src: 'img/**/*.png'
					dest: './.temp/'
					expand: true
				]
				options:
					optimizationLevel: 7

		# Compile LESS (.less) files to CSS (.css).
		less:
			styles:
				files:
					'./.temp/styles/styles.css': './src/styles/styles.less'

		# Minifiy index.html.
		# Extra white space and comments will be removed.
		# Content within <pre /> tags will be left unchanged.
		# IE conditional comments will be left unchanged.
		# As of this writing, the output is reduced by over 14%.
		minifyHtml:
			prod:
				files:
					'./.temp/index.min.html': './.temp/index.html'

		# Gathers all views and creates a file to push views directly into the $templateCache
		# This will produce a file with the following content.
		#
		# angular.module('app').run(['$templateCache', function ($templateCache) {
		# 	$templateCache.put('/views/directives/tab.html', '<div class="tab-pane" ng-class="{active: selected}" ng-transclude></div>');
		# 	$templateCache.put('/views/directives/tabs.html', '<div class="tabbable"> <ul class="nav nav-tabs"> <li ng-repeat="tab in tabs" ng-class="{active:tab.selected}"> <a href="http://localhost:3005/scripts/views.js" ng-click="select(tab)">{{tab.caption}}</a> </li> </ul> <div class="tab-content" ng-transclude></div> </div>');
		# 	$templateCache.put('/views/people.html', '<ul ng-hide="!people.length"> <li class="row" ng-repeat="person in people | orderBy:\'name\'"> <a ng-href="#/people/{{person.id}}" ng-bind="person.name"></a> </li> </ul>');
		# 	$templateCache.put('/views/repos.html', '<ul ng-hide="!repos.length"> <li ng-repeat="repo in repos | orderBy:\'pushed_at\':true"> <a ng-href="{{repo.url}}" ng-bind="repo.name" target="_blank"></a> <div ng-bind="repo.description"></div> </li> </ul>');
		# 	$templateCache.put('/views/tweets.html', '<ul ng-hide="!tweets.length"> <li class="row" ng-repeat="tweet in tweets"> <div class="span1 thumbnail"> <img ng-src="{{tweet.profile_image_url}}"/> </div> <div class="span6"> <div> <b ng-bind="tweet.from_user_name"></b> <a ng-href="https://twitter.com/{{tweet.from_user}}" ng-bind="tweet.from_user | twitterfy" target="_blank"></a> </div> <div ng-bind="tweet.text"></div> </div> </li> </ul>');
		# }]);
		#
		# This file is then included in the output automatically.  AngularJS will use it instead of going to the file system for the views, saving requests.  Notice that the view content is actually minified.  :)
		ngTemplateCache:
			views:
				files:
					'./.temp/scripts/views.js': './.temp/views/**/*.html'
				options:
					trim: './.temp'

		# Restart server when server sources have changed, notify all browsers on change.
		regarde:
			dist:
				files: './dist/**'
				tasks: 'livereload'
			server:
				files: [
					'server.coffee'
					'routes.coffee'
				]
				tasks: 'express-restart:livereload'

		# RequireJS optimizer configuration for both scripts and styles.
		# This configuration is only used in the 'prod' build.
		# The optimizer will scan the main file, walk the dependency tree, and write the output in dependent sequence to a single file.
		# Since RequireJS is not being used outside of the main file or for dependency resolution (this is handled by AngularJS), RequireJS is not needed for final output and is excluded.
		# RequireJS is still used for the 'dev' build.
		# The main file is used only to establish the proper loading sequence.
		requirejs:
			scripts:
				options:
					baseUrl: './.temp/scripts/'
					findNestedDependencies: true
					logLevel: 0
					mainConfigFile: './.temp/scripts/main.js'
					name: 'main'
					# Exclude main from the final output to avoid the dependency on RequireJS at runtime.
					onBuildWrite: (moduleName, path, contents) ->
						modulesToExclude = ['main']
						shouldExcludeModule = modulesToExclude.indexOf(moduleName) >= 0

						return '' if shouldExcludeModule

						contents
					optimize: 'uglify'
					out: './.temp/scripts/scripts.min.js'
					preserveLicenseComments: false
					skipModuleInsertion: true
					uglify:
						# Let uglifier replace variables to further reduce file size.
						no_mangle: false
			styles:
				options:
					baseUrl: './.temp/styles/'
					cssIn: './.temp/styles/styles.css'
					logLevel: 0
					optimizeCss: 'standard'
					out: './.temp/styles/styles.min.css'

		# Compile template files (.template) to HTML (.html).
		#
		# .template files are essentially html; however, you can take advantage of features provided by grunt such as underscore templating.
		#
		# The example below demonstrates the use of the environment configuration setting.
		# In 'prod' the concatenated and minified scripts are used along with a QueryString parameter of the hash of the file contents to address browser caching.
		# In environments other than 'prod' the individual files are used and loaded with RequireJS.
		#
		# <% if (config.environment === 'prod') { %>
		# 	<script src="/scripts/scripts.min.js?v=<%= config.hash('./.temp/scripts/scripts.min.js') %>"></script>
		# <% } else { %>
		# 	<script data-main="/scripts/main.js" src="/scripts/libs/require.js"></script>
		# <% } %>
		template:
			views:
				files:
					'./.temp/views/': './src/views/**/*.template'
			dev:
				files:
					'./.temp/index.html': './src/index.template'
				environment: 'dev'
			prod:
				files: '<%= template.dev.files %>'
				environment: 'prod'

		# Runs unit tests using testacular
		testacular:
			unit:
				options:
					autoWatch: true
					browsers: ['Chrome']
					colors: true
					configFile: './testacular.conf.js'
					keepalive: true
					port: 8081
					reporters: ['progress']
					runnerPort: 9100
					singleRun: true

		# Sets up file watchers and runs tasks when watched files are changed.
		watch:
			index:
				files: './src/index.template'
				tasks: [
					'template:dev'
					'copy:index'
				]
			scripts:
				files: './src/scripts/**'
				tasks: [
					'coffee:scripts'
					'copy:js'
					'copy:scripts'
				]
			styles:
				files: './src/styles/**/*.less'
				tasks: [
					'less'
					'copy:styles'
				]
			views:
				files: './src/views/**/*.template'
				tasks: [
					'template:views'
					'copy:views'
				]

	# Register grunt tasks supplied by grunt-contrib-*.
	# Referenced in package.json.
	# https://github.com/gruntjs/grunt-contrib
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-livereload'
	grunt.loadNpmTasks 'grunt-contrib-requirejs'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	# Express server + LiveReload
	grunt.loadNpmTasks 'grunt-express'

	# Register grunt tasks supplied by grunt-hustler.
	# Referenced in package.json.
	# https://github.com/CaryLandholt/grunt-hustler
	grunt.loadNpmTasks 'grunt-hustler'

	# Recommended watcher for LiveReload + Express.
	grunt.loadNpmTasks 'grunt-regarde'

	# Register grunt tasks supplied by grunt-testacular.
	# Referenced in package.json.
	# https://github.com/Dignifiedquire/grunt-testacular
	grunt.loadNpmTasks 'grunt-testacular'

	# Compiles the app with non-optimized build settings, places the build artifacts in the dist directory, and runs unit tests.
	# Enter the following command at the command line to execute this build task:
	# grunt test
	grunt.registerTask 'test', [
		'default'
		'testacular'
	]

	# Starts a web server
	# Enter the following command at the command line to execute this task:
	# grunt server
	grunt.registerTask 'server', [
		'livereload-start'
		'express'
		'regarde'
	]

	# Compiles all CoffeeScript files in the project to JavaScript then deletes all CoffeeScript files.
	# Used for those that desire plain old JavaScript.
	# Enter the following command at the command line to execute this build task:
	# grunt jslove
	grunt.registerTask 'jslove', [
		'coffee:jslove'
		'clean:jslove'
	]

	# Compiles the app with non-optimized build settings and places the build artifacts in the dist directory.
	# Enter the following command at the command line to execute this build task:
	# grunt
	grunt.registerTask 'default', [
		'clean:working'
		'coffee:scripts'
		'copy:js'
		'less'
		'template:views'
		'copy:img'
		'template:dev'
		'copy:dev'
	]

	# Compiles the app with non-optimized build settings, places the build artifacts in the dist directory, and watches for file changes.
	# Enter the following command at the command line to execute this build task:
	# grunt dev
	grunt.registerTask 'dev', [
		'default'
		'watch'
	]

	# Compiles the app with optimized build settings and places the build artifacts in the dist directory.
	# Enter the following command at the command line to execute this build task:
	# grunt prod
	grunt.registerTask 'prod', [
		'clean:working'
		'coffee:scripts'
		'copy:js'
		'less'
		'template:views'
		'imagemin'
		'ngTemplateCache'
		'requirejs'
		'template:prod'
		'minifyHtml'
		'copy:prod'
	]