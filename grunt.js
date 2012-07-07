/*global module*/

module.exports = function (grunt) {
	'use strict';

	grunt.initConfig({
		pkg: '<json:package.json>',

		// deletes the scripts and styles directories
		clean: {
			scripts: {
				src: '<%= pkg.scripts.build %>'
			},
			styles: {
				src: '<%= pkg.styles.build %>'
			}
		},

		// lint CoffeeScript
		coffeeLint: {
			scripts: {
				src: '<%= pkg.scripts.dev %>**/*.coffee',
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

		// copy source scripts and source styles to output directories
		copy: {
			scripts: {
				src: '<%= pkg.scripts.dev %>',
				dest: '<%= pkg.scripts.build %>'
			}
		},

		// compiles CoffeeScript to JavaScript
		coffee: {
			scripts: {
				src: '<%= pkg.scripts.dev %>',
				dest: '<%= pkg.scripts.build %>',
				bare: true
			}
		},

		// compiles Less to CSS
		less: {
			dev: {
				src: '<%= pkg.styles.dev %>bootstrap.less',
				dest: '<%= pkg.styles.build %>styles.css'
			},
			prod: {
				src: '<config:less.dev.src>',
				dest: '<%= pkg.styles.build %>styles.min.css',
				compress: true
			}
		},

		// optimizes files managed by RequireJS
		requirejs: {
			// minify scripts
			prod: {
				baseUrl: './scripts/js/',
				exclude: ['libs/modernizr', 'libs/angular', 'libs/angularResource'],
				findNestedDependencies: true,
				mainConfigFile: './scripts/js/main.js',
				name: 'main',
				out: './scripts/js/scripts.min.js',
				preserveLicenseComments: false,
				wrap: {
					startFile: './build/inlineDefines.js',
					end: ';'
				}
			}
		},

		lint: {
			scripts: ['<%= pkg.scripts.build %>!(libs)**/*.js']
		},

		jshint: {
			options: {
				// CoffeeScript uses null for default parameter values
				eqnull: true
			}
		},

		// delete dev files from build
		prune: {
			scripts: {
				src: '<%= pkg.scripts.build %>**/*.coffee'
			}
		},

		// watches for changes in coffe or less files
		// when changes are detected, copy the files to the build folder and compile
		watch: {
			scripts: {
				files: '<%= pkg.scripts.dev %>**/*.coffee',
				tasks: 'coffeeLint copy:scripts coffee prune:scripts'
			},
			styles: {
				files: '<%= pkg.styles.dev %>**/*.less',
				tasks: 'copy:styles less prune:styles'
			}
		},

		template: {
			dev: {
				src: './templates/index.template.html',
				dest: './index.html',
				environment: 'dev'
			},
			prod: {
				src: '<config:template.dev.src>',
				dest: '<config:template.dev.dest>',
				environment: 'prod'
			}
		}
	});

	grunt.loadTasks('tasks');
	grunt.registerTask('core', 'clean coffeeLint copy coffee requirejs lint prune');
	grunt.registerTask('bootstrap', 'core less:dev template:dev');
	grunt.registerTask('dev', 'bootstrap watch');
	grunt.registerTask('prod', 'core less:prod template:prod');
};