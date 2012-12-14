/*global module*/

module.exports = function (grunt) {
	'use strict';

	grunt.initConfig({
		pkg: '<json:package.json>',

		delete: {
			reset: {
				files: ['./dist/']
			},
			temp: {
        files: ['./temp/']
      }
		},

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

		less: {
			styles: {
				files: {
					'./temp/styles/styles.css': './src/styles/styles.less'
				}
			}
		},

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

		inlineTemplate: {
			views: {
				files: {
					'./temp/views/views.html': './temp/views/**/*.html'
				},
				type: 'text/ng-template',
				trim: 'temp'
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
					'./dist/img/': './temp/img/',
					'./dist/scripts/': './temp/scripts/scripts.min.js',
					'./dist/scripts/libs': ['./temp/scripts/libs/html5shiv-printshiv.js', './temp/scripts/libs/json2.js'],
					'./dist/styles/': './temp/styles/styles.min.css',
					'./dist/index.html': './temp/index.min.html'
				}
			},
			scripts: {
				files: {
					'./dist/scripts/': './temp/scripts/'
				}
			},
			styles: {
				files: {
					'./dist/styles/': './temp/styles/'
				}
			},
			index: {
				files: {
					'./dist/': './temp/index.html'
				}
			},
			views: {
				files: {
					'./dist/views/': './temp/views/'
				}
			}
		},

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

		minifyHtml: {
			prod: {
				files: {
					'./temp/index.min.html': './temp/index.html'
				}
			}
		},

		watch: {
			scripts: {
				files: './src/scripts/**/*.coffee',
				tasks: 'coffeeLint:scripts coffee:scripts copy:scripts'
			},
			styles: {
				files: './src/styles/**/*.less',
				tasks: 'less copy:styles'
			},
			index: {
				files: './src/index.template',
				tasks: 'template:dev copy:index'
			},
			views: {
				files: './src/views/**/*.template',
				tasks: 'template:views copy:views'
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