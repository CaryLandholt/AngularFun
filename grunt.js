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
			}
		},

		// compile CoffeeScript to JavaScript
		coffee: {
			dist: {
				src: './src/scripts/**/*.coffee',
				dest: './staging/scripts/',
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
					'./dist/index.html': './staging/index.min.html'
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
				src: './src/styles/bootstrap.less',
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
				include: 'requireLib',
				logLevel: 0,
				mainConfigFile: './staging/scripts/main.js',
				name: 'main',
				optimize: 'uglify',
				out: './staging/scripts/scripts.min.js',
				paths: {
					requireLib: 'libs/require'
				},
				preserveLicenseComments: false
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
				tasks: 'coffeeLint coffee lint'
			},
			less: {
				files: './ssrc/styles/**/*.less',
				tasks: 'less'
			},
			template: {
				files: '<config:template.dev.src>',
				tasks: 'template:dev'
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
};
