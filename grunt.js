/*global module*/

module.exports = function (grunt) {
	'use strict';

	grunt.initConfig({
		pkg: '<json:package.json>',

		// delete the dist folder
		delete: {
			dist: {
				dest: '<%= pkg.dist %>'
			}
		},

		// lint CoffeeScript
		coffeeLint: {
			scripts: {
				src: '<%= pkg.src %>/scripts/**/*.coffee',
				indentation: {
					value: 1
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
				src: '<%= pkg.src %>scripts/',
				dest: '<%= pkg.dist %>scripts/',
				bare: true
			}
		},

		copy: {
			libs: {
				src: '<%= pkg.src %>scripts/libs/',
				dest: '<%= pkg.dist %>scripts/libs/',
			},
			img: {
				src: '<%= pkg.src %>img/',
				dest: '<%= pkg.dist %>img/',
			}
		},

		lint: {
			scripts: ['<%= pkg.src %>!(libs)**/*.js']
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
				src: '<%= pkg.src %>styles/bootstrap.less',
				dest: '<%= pkg.dist %>/styles/styles.css'
			}
		},

		// compile templates
		template: {
			directives: {
				src: '<%= pkg.src %>/scripts/directives/templates/**/*.template',
				dest: '<%= pkg.dist %>/scripts/directives/templates/',
				ext: '.html'
			},
			dev: {
				src: '<%= pkg.src %>**/*.template',
				dest: '<%= pkg.dist %>',
				ext: '.html',
				environment: 'dev',
				indent_size: 1,
				indent_char: '\t',
				max_char: 10000
			},
			prod: {
				src: '<config:template.dev.src>',
				dest: '<config:template.dev.dest>',
				ext: '<config:template.dev.ext>',
				environment: 'prod',
				minify: true
			}
		},

		// optimizes files managed by RequireJS
		requirejs: {
			directives: {
				baseUrl: './dist/scripts/',
				exclude: ['libs/modernizr', 'libs/angular', 'libs/angularResource'],
				findNestedDependencies: true,
				mainConfigFile: './dist/scripts/main.js',
				name: 'main',
				optimize: 'none',
				out: './dist/scripts/scripts.js',
				preserveLicenseComments: false,
				wrap: {
					startFile: './build/inlineDefines.js',
					end: ';'
				}
			},
			scripts: {
				baseUrl: './dist/scripts/',
				exclude: ['libs/modernizr', 'libs/angular', 'libs/angularResource'],
				findNestedDependencies: true,
				mainConfigFile: './dist/scripts/main.js',
				name: 'main',
				out: './dist/scripts/scripts.{hash}.min.js',
				preserveLicenseComments: false,
				wrap: {
					startFile: './build/inlineDefines.js',
					end: ';'
				},
				hash: './dist/scripts/scripts.hash'
			},
			styles: {
				baseUrl: './dist/styles/',
				cssIn: './dist/styles/styles.css',
				optimizeCss: 'standard',
				out: './dist/styles/styles.{hash}.min.css',
				hash: './dist/styles/styles.hash'
			}
		},

		hash: {
			scripts: {
				src: '<%= pkg.dist %>scripts/scripts.js',
				dest: '<%= pkg.dist %>scripts/scripts.hash'
			},
			styles: {
				src: '<%= pkg.dist %>styles/styles.css',
				dest: '<%= pkg.dist %>styles/styles.hash'
			}
		},

		watch: {
			coffee: {
				files: '<%= pkg.src %>scripts/**/*.coffee',
				tasks: 'coffeeLint coffee lint'
			},
			less: {
				files: '<%= pkg.src %>styles/**/*.less',
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
				watch: true
			}
		}
	});

	grunt.loadNpmTasks('grunt-exec');
	grunt.loadNpmTasks('grunt-less');
	grunt.loadTasks('build/tasks');
	grunt.registerTask('core', 'delete coffeeLint coffee copy lint less');
	grunt.registerTask('bootstrap', 'core template:dev');
	grunt.registerTask('default', 'bootstrap');
	grunt.registerTask('dev', 'bootstrap watch');
	grunt.registerTask('prod', 'core template:directives requirejs:directives hash requirejs:scripts requirejs:styles template:prod');
};