/*global module*/

module.exports = function (grunt) {
	'use strict';

	grunt.initConfig({
		pkg: '<json:package.json>',

		// delete the dist folder
		delete: {
			reset: {
				files: ['./dist/', './temp/']
			}
		},

		// lint CoffeeScript
		coffeeLint: {
			scripts: {
				src: './src/scripts/**/*.coffee',
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
				src: './test/scripts/**/*.coffee',
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
			}
		},

		// compile CoffeeScript to JavaScript
		coffee: {
			dist: {
				src: './src/scripts/**/*.coffee',
				dest: './temp/scripts/',
				bare: true
			},
			tests: {
				src: './test/scripts/**/*.coffee',
				dest: './test/scripts/',
				bare: true
			}
		},

		copy: {
			temp: {
				files: {
					'./temp/scripts/libs/': './src/scripts/libs/',
					'./temp/img/': './src/img/'
				}
			},
			dev: {
				files: {
					'./dist/': './temp/'
				}
			},
			prod: {
				files: {
					'./dist/scripts/': './temp/scripts/scripts.min.js',
					'./dist/scripts/libs/': ['./temp/scripts/libs/html5shiv-printshiv.js', './temp/scripts/libs/json2.js'],
					'./dist/styles/': './temp/styles/styles.min.css',
					'./dist/img/': './temp/img/',
					'./dist/index.html': './temp/index.min.html',
					'./dist/views/': './temp/views/'
				}
			},
			scripts: {
				files: {
					'./dist/': './temp/**/*.js'
				}
			},
			styles: {
				files: {
					'./dist/': './temp/**/*.css'
				}
			},
			views: {
				files: {
					'./dist/': './temp/**/*.html'
				}
			}
		},

		lint: {
			scripts: ['./src/!(libs)**/*.js']
		},

		jshint: {
			options: {
				// CoffeeScript uses null for default parameter values
				eqnull: true
			}
		},

		// compile Less to CSS
		less: {
			dist: {
				src: './src/styles/styles.less',
				dest: './temp/styles/styles.css'
			}
		},

		// compile templates
		template: {
			dev: {
				src: './src/**/*.template',
				dest: './temp/',
				environment: 'dev'
			},
			prod: {
				src: '<config:template.dev.src>',
				dest: '<config:template.dev.dest>',
				environment: 'prod'
			},
			views: {
				files: {
					'./temp/views/': './src/views/**/*.template'
				}
			}
		},

		// optimizes files managed by RequireJS
		requirejs: {
			scripts: {
				baseUrl: './temp/scripts/',
				findNestedDependencies: true,
				logLevel: 0,
				mainConfigFile: './temp/scripts/main.js',
				name: 'main',
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

		inlineTemplate: {
			views: {
				files: {
					'./temp/views/views.html': './temp/views/**/*.html'
				},
				type: 'text/ng-template',
				trim: 'temp'
			}
		},

		minifyHtml: {
			prod: {
				files: {
					'./temp/index.min.html': './temp/index.html'
				}
			}
		},

		watch: {
			coffee: {
				files: './src/scripts/**/*.coffee',
				tasks: 'coffeeLint coffee lint copy:scripts'
			},
			less: {
				files: './src/styles/**/*.less',
				tasks: 'less copy:styles'
			},
			template: {
				files: '<config:template.dev.src>',
				tasks: 'template:dev copy:views'
			}
		},

		server: {
			app: {
				src: './server.coffee',
				port: 3005,
				watch: './routes.coffee'
			}
		}
	});

	grunt.loadNpmTasks('grunt-hustler');

	grunt.registerTask('unit-tests', 'run the testacular test driver on jasmine unit tests', function () {
		var done = this.async();

		require('child_process').exec('./node_modules/testacular/bin/testacular start ./testacular.conf.js --single-run', function (err, stdout) {
			grunt.log.write(stdout);
			done(err);
		});
	});

	grunt.registerTask('default', [
		'delete',
		'coffeeLint',
		'coffee',
		'lint',
		'less',
		'template:views',
		'inlineTemplate',
		'template:dev',
		'copy:temp',
		'copy:dev'
	]);

	grunt.registerTask('dev', [
		'delete',
		'coffeeLint',
		'coffee',
		'lint',
		'less',
		'template:views',
		'inlineTemplate',
		'template:dev',
		'copy:temp',
		'copy:dev',
		'watch'
	]);

	grunt.registerTask('prod', [
		'delete',
		'coffeeLint',
		'coffee',
		'lint',
		'less',
		'template:views',
		'inlineTemplate',
		'template:prod',
		'copy:temp',
		'requirejs',
		'minifyHtml',
		'copy:prod'
	]);

	grunt.registerTask('test', [
		'default',
		'unit-tests'
	]);
};