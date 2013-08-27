# Build configurations
module.exports = (grunt) ->
	grunt.initConfig
		# Deletes dist and .temp directories
		# The .temp directory is used during the build process
		# The dist directory contains the artifacts of the build
		# These directories should be deleted before subsequent builds
		# These directories are not committed to source control
		clean:
			working: [
				'./.temp/'
				'./dist/'
			]
			# Used for those that desire plain old JavaScript
			jslove: [
				'**/*.coffee'
				'!**/bower_components/**'
				'!**/node_modules/**'
			]

		# Compiles CoffeeScript (.coffee) files to JavaScript (.js)
		coffee:
			app:
				cwd: './.temp/'
				src: '**/*.coffee'
				dest: './.temp/'
				expand: true
				ext: '.js'
				options:
					sourceMap: true
			# Used for those that desire plain old JavaScript
			jslove:
				files: [
					cwd: './'
					src: [
						'**/*.coffee'
						'!**/bower_components/**'
						'!**/node_modules/**'
					]
					dest: './'
					expand: true
					ext: '.js'
				]

		# Lints CoffeeScript files
		coffeelint:
			scripts: './src/scripts/**/*.coffee'
			options:
				indentation:
					value: 1
				max_line_length:
					level: 'ignore'
				no_tabs:
					level: 'ignore'

		# Sets up a web server
		connect:
			app:
				options:
					base: './dist/'
					middleware: require './middleware'
					port: 0

		# Copies directories and files from one location to another
		copy:
			app:
				files: [
					cwd: './src/'
					src: '**'
					dest: './.temp/'
					expand: true
				,
					cwd: './bower_components/angular/'
					src: 'angular.*'
					dest: './.temp/scripts/libs/'
					expand: true
				,
					cwd: './bower_components/angular-animate/'
					src: 'angular-animate.*'
					dest: './.temp/scripts/libs/'
					expand: true
				,
					cwd: './bower_components/angular-resource/'
					src: 'angular-resource.*'
					dest: './.temp/scripts/libs/'
					expand: true
				,
					cwd: './bower_components/angular-route/'
					src: 'angular-route.*'
					dest: './.temp/scripts/libs/'
					expand: true
				,
					cwd: './bower_components/bootstrap/less/'
					src: '*'
					dest: './.temp/styles/'
					expand: true
				,
					cwd: './bower_components/bootstrap/fonts/'
					src: '*'
					dest: './.temp/fonts/'
					expand: true
				,
					cwd: './bower_components/html5shiv/dist/'
					src: 'html5shiv-printshiv.js'
					dest: './.temp/scripts/libs/'
					expand: true
				,
					cwd: './bower_components/json3/lib/'
					src: 'json3.min.js'
					dest: './.temp/scripts/libs/'
					expand: true
				,
					cwd: './bower_components/requirejs/'
					src: 'require.js'
					dest: './.temp/scripts/libs/'
					expand: true
				]
			dev:
				cwd: './.temp/'
				src: '**'
				dest: './dist/'
				expand: true
			prod:
				files: [
					cwd: './.temp/fonts/'
					src: '**'
					dest: './dist/fonts/'
					expand: true
				,
					cwd: './.temp/images/'
					src: '**'
					dest: './dist/images/'
					expand: true
				,
					cwd: './.temp/'
					src: [
						'scripts/ie.min.*.js'
						'scripts/scripts.min.*.js'
					]
					dest: './dist/'
					expand: true
				,
					cwd: './.temp/'
					src: 'styles/styles.min.*.css'
					dest: './dist/'
					expand: true
				,
					'./dist/index.html': './.temp/index.min.html'
				]

		# Renames files based on their hashed content
		# When the files contents change, the hash value changes
		# Used as a cache buster, ensuring browsers load the correct static resources
		#
		# glyphicons-halflings.png -> glyphicons-halflings.6c8829cc6f.png
		# scripts.min.js -> scripts.min.6c355e03ee.js
		hash:
			images: './.temp/images/**/*'
			scripts:
				src: [
					'./.temp/scripts/ie.min.js'
					'./.temp/scripts/scripts.min.js'
				]
			styles: './.temp/styles/styles.min.css'

		# Compresses png files
		imagemin:
			images:
				files: [
					cwd: './.temp/'
					src: 'images/**/*.png'
					dest: './.temp/'
					expand: true
				]
				options:
					optimizationLevel: 7

		# Compiles jade templates
		jade:
			views:
				cwd: './.temp/'
				src: '**/*.jade'
				dest: './.temp/'
				expand: true
				ext: '.html'
				options:
					pretty: true

		# Runs unit tests using karma
		karma:
			unit:
				options:
					autoWatch: true
					browsers: [
						'PhantomJS'
					]
					captureTimeout: 5000
					colors: true
					files: [
						'./dist/scripts/libs/angular.js'
						'./dist/scripts/libs/angular-animate.js'
						'./dist/scripts/libs/angular-route.js'
						'./dist/scripts/libs/angular-resource.js'
						'./bower_components/angular-mocks/angular-mocks.js'
						'./dist/scripts/**/*.js'
						'./test/scripts/**/*.{coffee,js}'
					]
					frameworks: [
						'jasmine'
					]
					junitReporter:
						outputFile: './test-results.xml'
					keepalive: false
					logLevel: 'INFO'
					port: 9876
					preprocessors:
						'**/*.coffee': 'coffee'
					reporters: [
						'dots'
						'junit'
						'progress'
					]
					runnerPort: 9100
					singleRun: true

		# Compile LESS (.less) files to CSS (.css)
		less:
			app:
				files:
					'./.temp/styles/styles.css': './.temp/styles/styles.less'

		# Minifies index.html
		# Extra white space and comments will be removed
		# Content within <pre /> tags will be left unchanged
		# IE conditional comments will be left unchanged
		# Reduces file size by over 14%
		minifyHtml:
			prod:
				files:
					'./.temp/index.min.html': './.temp/index.html'

		# Creates main file for RequireJS
		ngShim:
			scripts:
				cwd: './.temp/scripts/'
				angular: 'libs/angular.min.js'
				modules: [
					'ngAnimate': 'libs/angular-animate.min.js'
					'ngResource': 'libs/angular-resource.min.js'
					'ngRoute': 'libs/angular-route.min.js'
				]
				src: '**/*.coffee'
				dest: 'main.coffee'

		# Creates a file to push views directly into the $templateCache
		# This will produce a file with the following content
		#
		# angular.module('app').run(['$templateCache', function ($templateCache) {
		# 	$templateCache.put('/views/directives/tab.html', '<div class="tab-pane" ng-class="{active: selected}" ng-transclude></div>');
		# 	$templateCache.put('/views/directives/tabs.html', '<div class="tabbable"> <ul class="nav nav-tabs"> <li ng-repeat="tab in tabs" ng-class="{active:tab.selected}"> <a href="http://localhost:3005/scripts/views.js" ng-click="select(tab)">{{tab.caption}}</a> </li> </ul> <div class="tab-content" ng-transclude></div> </div>');
		# 	$templateCache.put('/views/people.html', '<ul ng-hide="!people.length"> <li class="row" ng-repeat="person in people | orderBy:\'name\'"> <a ng-href="#/people/{{person.id}}" ng-bind="person.name"></a> </li> </ul>');
		# 	$templateCache.put('/views/repos.html', '<ul ng-hide="!repos.length"> <li ng-repeat="repo in repos | orderBy:\'pushed_at\':true"> <a ng-href="{{repo.url}}" ng-bind="repo.name" target="_blank"></a> <div ng-bind="repo.description"></div> </li> </ul>');
		# 	$templateCache.put('/views/tweets.html', '<ul ng-hide="!tweets.length"> <li class="row" ng-repeat="tweet in tweets"> <div class="span1 thumbnail"> <img ng-src="{{tweet.profile_image_url}}"/> </div> <div class="span6"> <div> <b ng-bind="tweet.from_user_name"></b> <a ng-href="https://twitter.com/{{tweet.from_user}}" ng-bind="tweet.from_user | twitterfy" target="_blank"></a> </div> <div ng-bind="tweet.text"></div> </div> </li> </ul>');
		# }]);
		#
		# This file is then included in the output automatically
		# AngularJS will use it instead of going to the file system for the views, saving requests
		# Notice that the view content is actually minified.  :)
		ngTemplateCache:
			views:
				files:
					'./.temp/scripts/views.js': './.temp/views/**/*.html'
				options:
					trim: './.temp'

		# Opens the app in the default browser
		open:
			server:
				url: 'http://localhost:<%= connect.app.options.port %>'

		# RequireJS optimizer configuration for both scripts and styles
		# This configuration is only used in the 'prod' build
		# The optimizer will scan the main file, walk the dependency tree, and write the output in dependent sequence to a single file
		# Since RequireJS is not being used outside of the main file or for dependency resolution (this is handled by AngularJS), RequireJS is not needed for final output and is excluded
		# RequireJS is still used for the 'dev' build
		# The main file is used only to establish the proper loading sequence
		requirejs:
			scripts:
				options:
					baseUrl: './.temp/scripts/'
					findNestedDependencies: true
					logLevel: 0
					mainConfigFile: './.temp/scripts/main.js'
					name: 'main'
					# Exclude main from the final output to avoid the dependency on RequireJS at runtime
					onBuildWrite: (moduleName, path, contents) ->
						modulesToExclude = ['main']
						shouldExcludeModule = modulesToExclude.indexOf(moduleName) >= 0

						return '' if shouldExcludeModule

						contents
					optimize: 'uglify2'
					out: './.temp/scripts/scripts.min.js'
					preserveLicenseComments: false
					skipModuleInsertion: true
					uglify:
						# Let uglifier replace variables to further reduce file size
						no_mangle: false
					useStrict: true
					wrap:
						start: '(function(){\'use strict\';'
						end: '}).call(this);'
			styles:
				options:
					baseUrl: './.temp/styles/'
					cssIn: './.temp/styles/styles.css'
					logLevel: 0
					optimizeCss: 'standard'
					out: './.temp/styles/styles.min.css'


		# Compiles underscore expressions
		#
		# The example below demonstrates the use of the environment configuration setting
		# In 'prod' build the hashed file of the concatenated and minified scripts is referened
		# In environments other than 'prod' the individual files are used and loaded with RequireJS
		#
		# <% if (config.environment === 'prod') { %>
		# 	<script src="<%= config.getHashedFile('./.temp/scripts/scripts.min.js', {trim: './.temp'}) %>"></script>
		# <% } else { %>
		# 	<script data-main="/scripts/main.js" src="/scripts/libs/require.js"></script>
		# <% } %>
		template:
			indexDev:
				files: './.temp/index.html': './.temp/index.html'
			index:
				files: '<%= template.indexDev.files %>'
				environment: 'prod'

		# Concatenates and minifies JavaScript files
		uglify:
			scripts:
				files:
					'./.temp/scripts/ie.min.js': [
						'./.temp/scripts/libs/json3.js'
						'./.temp/scripts/libs/html5shiv-printshiv.js'
					]

		# Run tasks when monitored files change
		watch:
			dev:
				files: [
					'./src/index.html'
					'./src/fonts/**'
					'./src/images/**'
					'./src/scripts/**'
					'./src/styles/**'
					'./src/views/**'
				]
				tasks: [
					'build'
					'karma'
				]
				options:
					livereload: true
			# Used to keep the web server alive
			none:
				files: 'none'
				options:
					livereload: true

	# Register grunt tasks supplied by grunt-coffeelint.
	# Referenced in package.json.
	# https://github.com/vojtajina/grunt-coffeelint
	grunt.loadNpmTasks 'grunt-coffeelint'

	# Register grunt tasks supplied by grunt-contrib-*.
	# Referenced in package.json.
	# https://github.com/gruntjs/grunt-contrib
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-livereload'
	grunt.loadNpmTasks 'grunt-contrib-requirejs'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	# Register grunt tasks supplied by grunt-hustler.
	# Referenced in package.json.
	# https://github.com/CaryLandholt/grunt-hustler
	grunt.loadNpmTasks 'grunt-hustler'

	# Register grunt tasks supplied by grunt-karma.
	# Referenced in package.json.
	# https://github.com/karma-runner/grunt-karma
	grunt.loadNpmTasks 'grunt-karma'

	# Register grunt tasks supplied by grunt-open.
	# Referenced in package.json.
	# https://github.com/onehealth/grunt-open
	grunt.loadNpmTasks 'grunt-open'

	# Compiles the app with non-optimized build settings
	# Places the build artifacts in the dist directory
	# Enter the following command at the command line to execute this build task:
	# grunt build
	grunt.registerTask 'build', [
		'clean:working'
		'coffeelint'
		'copy:app'
		'ngShim'
		'coffee:app'
		'less'
		'jade'
		'template:indexDev'
		'copy:dev'
	]

	# Compiles the app with non-optimized build settings
	# Places the build artifacts in the dist directory
	# Opens the app in the default browser
	# Watches for file changes, and compiles and reloads the web browser upon change
	# Enter the following command at the command line to execute this build task:
	# grunt or grunt default
	grunt.registerTask 'default', [
		'build'
		'connect'
		'open'
		'watch'
	]

	# Identical to the default build task
	# Compiles the app with non-optimized build settings
	# Places the build artifacts in the dist directory
	# Opens the app in the default browser
	# Watches for file changes, and compiles and reloads the web browser upon change
	# Enter the following command at the command line to execute this build task:
	# grunt dev
	grunt.registerTask 'dev', [
		'default'
	]

	# Compiles the app with optimized build settings
	# Places the build artifacts in the dist directory
	# Enter the following command at the command line to execute this build task:
	# grunt prod
	grunt.registerTask 'prod', [
		'clean:working'
		'coffeelint'
		'copy:app'
		'ngShim'
		'coffee:app'
		'imagemin'
		'hash:images'
		'less'
		'jade'
		'ngTemplateCache'
		'requirejs'
		'uglify'
		'hash:scripts'
		'hash:styles'
		'template:index'
		'minifyHtml'
		'copy:prod'
	]

	# Opens the app in the default browser
	# Build artifacts must be in the dist directory via a prior grunt build, grunt, grunt dev, or grunt prod
	# Enter the following command at the command line to execute this build task:
	# grunt server
	grunt.registerTask 'server', [
		'connect'
		'open'
		'watch:none'
	]

	# Compiles the app with non-optimized build settings
	# Places the build artifacts in the dist directory
	# Runs unit tests via karma
	# Enter the following command at the command line to execute this build task:
	# grunt test
	grunt.registerTask 'test', [
		'build'
		'karma'
	]

	# Compiles all CoffeeScript files in the project to JavaScript then deletes all CoffeeScript files
	# Used for those that desire plain old JavaScript
	# Enter the following command at the command line to execute this build task:
	# grunt jslove
	grunt.registerTask 'jslove', [
		'coffee:jslove'
		'clean:jslove'
	]