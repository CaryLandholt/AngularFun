module.exports = function (grunt) {
	grunt.initConfig({
		/*
			deletes dist and temp directories
			the temp directory is used during the build process
			the dist directory contains the artifacts of the build
			these directories should be deleted before subsequent builds
		*/
		delete: {
			reset: {
				files: ['./dist/']
			},
			temp: {
				files: ['./temp/']
			}
		},

		/*
			contains linting rules for CoffeeScript files
		*/
		coffeeLint: {
			scripts: {
				files: ['./src/scripts/**/*.coffee'],
				indentation: {
					value: 1,
					level: 'error'
				},
				max_line_length: {
					level: 'ignore'
				},
				no_tabs: {
					level: 'ignore'
				}
			},
			tests: {
				files: ['./test/scripts/**/*.coffee'],
				indentation: '<config:coffeeLint.scripts.indentation>',
				max_line_length: '<config:coffeeLint.scripts.max_line_length>',
				no_tabs: '<config:coffeeLint.scripts.no_tabs>',
			}
		},


		/*
			compiles CoffeeScript (.coffee) files to JavaScript (.js)
		*/
		coffee: {
			scripts: {
				files: {
					'./temp/scripts/': './src/scripts/**/*.coffee'
				},
				bare: true
			},
			tests: {
				files: {
					'./test/scripts/': './test/scripts/**/*.coffee'
				},
				bare: true
			}
		},

		/*
			compiles LESS (.less) files to CSS (.css)
		*/
		less: {
			styles: {
				files: {
					'./temp/styles/styles.css': './src/styles/styles.less'
				}
			}
		},

		/*
			compiles template files (.template) to HTML (.html)

			.template files are essentially html; however, you can take advantage
			of features provided by grunt such as underscore templating

			the example below demonstrates the use of the environment attribute
			in 'prod' the concatenated and minified scripts are used along with a unique QueryString parameter to address browser caching
			in environments other than 'prod' the individual files are used and loaded with RequireJS

			<% if (config.environment === 'prod') { %>
				<script src="/scripts/scripts.min.js?_=v<%= config.uniqueVersion() %>"></script>
			<% } else { %>
				<script data-main="/scripts/main.js" src="/scripts/libs/require.js"></script>
			<% } %>
		*/
		template: {
			views: {
				files: {
					'./temp/views/': './src/views/**/*.template'
				}
			},
			dev: {
				files: {
					'./temp/index.html': './src/index.template'
				},
				environment: 'dev'
			},
			prod: {
				files: '<config:template.dev.files>',
				environment: 'prod'
			}
		},

		/*
			creates a single file consisting of multiple html (views) files surrounded by script tags

			for example, take the following two files,
			/temp/views/people.html (compiled from /src/views/people.template)
			<ul ng-hide="!people.length">
				<li class="row" ng-repeat="person in people | orderBy:'name'">
					<a ng-href="#/people/{{person.id}}" ng-bind="person.name"></a>
				</li>
			</ul>

			/temp/views/repos.html (compiled from /src/views/repos.html)
			<ul ng-hide="!repos.length">
				<li ng-repeat="repo in repos | orderBy:'pushed_at':true">
					<a ng-href="{{repo.url}}" ng-bind="repo.name" target="_blank"></a>
					<div ng-bind="repo.description"></div>
				</li>
			</ul>

			AngularJS will interpret inlined scripts with type of "text/ng-template" in lieu of retrieving the view from the server
			the id of the script tag must match the path requested
			since the path includes the temp directory, this must be trimmed

			the output of the configuration below is:
			/temp/views/views.html
			<script id="/views/people.html" type="text/ng-template">
				<ul ng-hide="!people.length">
					<li class="row" ng-repeat="person in people | orderBy:'name'">
						<a ng-href="#/people/{{person.id}}" ng-bind="person.name"></a>
					</li>
				</ul>
			</script>
			<script id="/views/repos.html" type="text/ng-template">
				<ul ng-hide="!repos.length">
					<li ng-repeat="repo in repos | orderBy:'pushed_at':true">
						<a ng-href="{{repo.url}}" ng-bind="repo.name" target="_blank"></a>
						<div ng-bind="repo.description"></div>
					</li>
				</ul>
			</script>

			now the views.html file can be included in the application and avoid making requests to the server for the templates
		*/
		inlineTemplate: {
			views: {
				files: {
					'./temp/views/views.html': './temp/views/**/*.html'
				},
				type: 'text/ng-template',
				trim: 'temp'
			}
		},

		/*
			copies directories and files from one location to another
		*/
		copy: {
			// copies libs and img directories to temp
			temp: {
				files: {
					'./temp/scripts/libs/': './src/scripts/libs/',
					'./temp/img/': './src/img/'
				}
			},
			// copies the contents of the temp directory to the dist directory
			// in 'dev' individual files are used
			dev: {
				files: {
					'./dist/': './temp/'
				}
			},
			// copies select files from the temp directory to the dist directory
			// in 'prod' minified files are used along with img and libs
			// the dist artifacts contain only the files necessary to run the application
			prod: {
				files: {
					'./dist/img/': './temp/img/',
					'./dist/scripts/': './temp/scripts/scripts.min.js',
					'./dist/scripts/libs': ['./temp/scripts/libs/html5shiv-printshiv.js', './temp/scripts/libs/json2.js'],
					'./dist/styles/': './temp/styles/styles.min.css',
					'./dist/index.html': './temp/index.min.html'
				}
			},
			// task is run when a watched script is modified
			scripts: {
				files: {
					'./dist/scripts/': './temp/scripts/'
				}
			},
			// task is run when a watched style is modified
			styles: {
				files: {
					'./dist/styles/': './temp/styles/'
				}
			},
			// task is run when the watched index.template file is modified
			index: {
				files: {
					'./dist/': './temp/index.html'
				}
			},
			// task is run when a watched view is modified
			views: {
				files: {
					'./dist/views/': './temp/views/'
				}
			}
		},

		/*
			RequireJS optimizer configuration for both scripts and styles
			this configuration is only used in the 'prod' build
			the optimizer will scan the main file, walk the dependency tree, and write the output in dependent sequence to a single file
			since RequireJS is not being used outside of the main file, RequireJS is not needed for final output and is excluded
			RequireJS is still used for the 'dev' build
			the main file is used only to establish the proper loading sequence
		*/
		requirejs: {
			scripts: {
				baseUrl: './temp/scripts/',
				findNestedDependencies: true,
				logLevel: 0,
				mainConfigFile: './temp/scripts/main.js',
				name: 'main',
				// exclude main from the final output to avoid the dependency on RequireJS at runtime
				onBuildWrite: function (moduleName, path, contents) {
					var modulesToExclude = ['main'],
						shouldExcludeModule = modulesToExclude.indexOf(moduleName) >= 0;

					if (shouldExcludeModule) {
						return '';
					}

					return contents;
				},
				optimize: 'uglify',
				out: './temp/scripts/scripts.min.js',
				preserveLicenseComments: false,
				skipModuleInsertion: true,
				uglify: {
					no_mangle: false
				}
			},
			styles: {
				baseUrl: './temp/styles/',
				cssIn: './temp/styles/styles.css',
				logLevel: 0,
				optimizeCss: 'standard',
				out: './temp/styles/styles.min.css'
			}
		},

		/*
			minifies index.html
			extra white space and comments will be removed
			content within <pre /> tags will be left unchanged
			IE conditional comments will be left unchanged
			as of this writing, the output is reduced by over 14%
		*/
		minifyHtml: {
			prod: {
				files: {
					'./temp/index.min.html': './temp/index.html'
				}
			}
		},

		/*
			sets up file watchers and runs tasks when watched files are changed
		*/
		watch: {
			scripts: {
				files: './src/scripts/**/*.coffee',
				tasks: 'coffeeLint:scripts coffee:scripts copy:scripts reload'
			},
			styles: {
				files: './src/styles/**/*.less',
				tasks: 'less copy:styles reload'
			},
			index: {
				files: './src/index.template',
				tasks: 'template:dev copy:index reload'
			},
			views: {
				files: './src/views/**/*.template',
				tasks: 'template:views copy:views reload'
			}
		},

		/*
			runs a web server at the specified port
			can optionally watch for changes to the file referenced in the watch setting
			the web server will automatically restart once the changes have been saved
		*/
		server: {
			app: {
				src: './server.coffee',
				port: 3005,
				watch: './routes.coffee'
			}
		},

		/*
			leverages the LiveReload browser plugin to automatically reload the browser when watched files have changed

			as of this writing, Chrome, Firefox, and Safari are supported

			get the plugin:
			here http://help.livereload.com/kb/general-use/browser-extensions
		*/
		reload: {
			liveReload: true,
			port: 35729
		}
	});

	grunt.loadNpmTasks('grunt-hustler');
	grunt.loadNpmTasks('grunt-reload');

	grunt.registerTask('unit-tests', 'run the testacular test driver on jasmine unit tests', function () {
		var done = this.async();

		require('child_process').exec('./node_modules/testacular/bin/testacular start ./testacular.conf.js --single-run', function (err, stdout) {
			grunt.log.write(stdout);
			done(err);
		});
	});

	grunt.registerTask('default', [
		'delete',
		'coffeeLint:scripts',
		'coffee:scripts',
		'less',
		'template:views',
		'template:dev',
		'copy:temp',
		'copy:dev',
		'delete:temp'
	]);

	grunt.registerTask('dev', [
		'default',
		'reload',
		'watch'
	]);

	grunt.registerTask('prod', [
		'delete',
		'coffeeLint:scripts',
		'coffee:scripts',
		'less',
		'template:views',
		'inlineTemplate',
		'template:prod',
		'copy:temp',
		'requirejs',
		'minifyHtml',
		'copy:prod',
		'delete:temp'
	]);

	grunt.registerTask('test', [
		'coffeeLint:tests',
		'coffee:tests',
		'default',
		'unit-tests'
	]);
};