/*global module*/

module.exports = function (grunt) {
	'use strict';

	grunt.initConfig({
		pkg: '<json:package.json>',

		// delete the dist folder
		delete: {
			dist: {
				dest: '<%= pkg.dist %>'
			},
			coffee: {
				dest: '<%= pkg.dist %>scripts/**/*.coffee'
			},
			less: {
				dest: '<%= pkg.dist %>styles/**/*.less'
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

		// copy the contents of the src folder to the dist folder
		copy: {
			dist: {
				src: '<%= pkg.src %>',
				dest: '<%= pkg.dist %>'
			}
		},

		// compile CoffeeScript to JavaScript
		coffee: {
			dist: {
				src: '<%= pkg.src %>',
				dest: '<%= pkg.dist %>',
				bare: true
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
			dev: {
				src: '<%= pkg.src %>index.html',
				dest: '<%= pkg.dist %>index.html',
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
			// minify scripts
			scripts: {
				baseUrl: './dist/scripts/',
				exclude: ['libs/modernizr', 'libs/angular', 'libs/angularResource'],
				findNestedDependencies: true,
				mainConfigFile: './dist/scripts/main.js',
				name: 'main',
				out: './dist/scripts/scripts.min.js',
				preserveLicenseComments: false,
				wrap: {
					startFile: './build/inlineDefines.js',
					end: ';'
				}
			},
			styles: {
				baseUrl: './dist/styles/',
				cssIn: './dist/styles/styles.css',
				optimizeCss: 'standard',
				out: './dist/styles/styles.min.css'
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
				files: '<%= pkg.src %>index.html',
				tasks: 'template:dev'
			}
		}
	});

	grunt.loadTasks('build/tasks');
	grunt.registerTask('core', 'delete:dist coffeeLint copy coffee lint less');
	grunt.registerTask('bootstrap', 'core template:dev');
	grunt.registerTask('dev', 'bootstrap watch');
	grunt.registerTask('prod', 'core requirejs template:prod delete:coffee delete:less');
};