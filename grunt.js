/*global module*/

module.exports = function (grunt) {
	'use strict';

	grunt.initConfig({
		pkg: '<json:package.json>',

		// delete the dist folder
		delete: {
			reset: {
				files: ['./dist/', './staging/']
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
				dest: './staging/scripts/',
				bare: true
			},
			tests: {
				src: './test/scripts/**/*.coffee',
				dest: './test/scripts/',
				bare: true
			}
		},

		copy: {
			staging: {
				files: {
					'./staging/scripts/libs/': './src/scripts/libs/',
					'./staging/img/': './src/img/'
				}
			},
			dev: {
				files: {
					'./dist/': './staging/'
				}
			},
			prod: {
				files: {
					'./dist/scripts/': './staging/scripts/scripts.min.js',
					'./dist/scripts/libs/': ['./staging/scripts/libs/html5shiv-printshiv.js', './staging/scripts/libs/json2.js'],
					'./dist/styles/': './staging/styles/styles.min.css',
					'./dist/img/': './staging/img/',
					'./dist/index.html': './staging/index.min.html',
					'./dist/views/': './staging/views/'
				}
			},
			scripts: {
				files: {
					'./dist/': './staging/**/*.js'
				}
			},
			styles: {
				files: {
					'./dist/': './staging/**/*.css'
				}
			},
			views: {
				files: {
					'./dist/': './staging/**/*.html'
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
				dest: './staging/styles/styles.css'
			}
		},

		// compile templates
		template: {
			dev: {
				src: './src/**/*.template',
				dest: './staging/',
				environment: 'dev'
			},
			prod: {
				src: '<config:template.dev.src>',
				dest: '<config:template.dev.dest>',
				environment: 'prod'
			}
		},

		// optimizes files managed by RequireJS
		requirejs: {
			scripts: {
				baseUrl: './staging/scripts/',
				findNestedDependencies: true,
				logLevel: 0,
				mainConfigFile: './staging/scripts/main.js',
				name: 'main',
				onBuildWrite: function (moduleName, path, contents) {
					if (moduleName === 'main') {
						return '';
					}

					return contents;
				},
				optimize: 'uglify',
				out: './staging/scripts/scripts.min.js',
				preserveLicenseComments: false,
				skipModuleInsertion: true
			},
			styles: {
				baseUrl: './staging/styles/',
				cssIn: './staging/styles/styles.css',
				logLevel: 0,
				optimizeCss: 'standard',
				out: './staging/styles/styles.min.css'
			}
		},

		minifyHtml: {
			prod: {
				files: {
					'./staging/index.min.html': './staging/index.html'
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
		'template:dev',
		'copy:staging',
		'copy:dev'
	]);

	grunt.registerTask('dev', [
		'delete',
		'coffeeLint',
		'coffee',
		'lint',
		'less',
		'template:dev',
		'copy:staging',
		'copy:dev',
		'watch'
	]);

	grunt.registerTask('prod', [
		'delete',
		'coffeeLint',
		'coffee',
		'lint',
		'less',
		'template:prod',
		'copy:staging',
		'requirejs',
		'minifyHtml',
		'copy:prod'
	]);

	grunt.registerTask('test', [
		'default',
		'unit-tests'
	]);
};