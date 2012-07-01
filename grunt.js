/*global module*/

module.exports = function (grunt) {
	'use strict';

	//<config:coffee.dist.dest>

	// grunt clean
	// grunt copy
	// grunt coffee
	// delete coffee files in build folder after compilation?

	grunt.initConfig({
		pkg: '<json:package.json>',

		meta: {
			banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
				'<%= grunt.template.today("yyyy-mm-dd") %> */'
		},

		watch: {
			files: './scripts/**/*.coffee',
			tasks: 'copy coffee'
		},

		// deletes the build folder
		clean: {
			build: {
				dest: './build/'
			}
		},

		// copy scripts to the build directory
		copy: {
			build: {
				src: './scripts/',
				dest: './build/'
			}
		},

		// compiles CoffeeScript to JavaScript
		coffee: {
			build: {
				src: './build/',
				dest: './build/',
				bare: true
			}
		},

		// concatenates files managed by RequireJS, sans minification
		requirejs: {
			build: {
				baseUrl: './build/',
				mainConfigFile: './build/main.js',
				name: 'main',
				out: './build/scripts.js',
				preserveLicenseComments: false,
				paths: {
					requireLib: 'libs/require'
				},
				include: ['requireLib'],
				findNestedDependencies: true,

				// let grunt's min handle this
				optimize: 'none'
			}
		},

		 // for some reason the minified file fails at runtime
		 // this is happening regardless of which minifier is used
		min: {
			build: {
				src: ['<banner>', './build/scripts.js'],
				dest: './build/scripts.min.js'
			}
		},

		lint: {
			build: ['./build/!(libs)**/*.js']
		},

		coffeeLint: {
			build: {
				src: './scripts/**/*.coffee',
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

		jshint: {
			options: {
				// CoffeeScript uses null for default parameter values
				eqnull: true
			}
		}
	});

	grunt.loadTasks('tasks');
	grunt.registerTask('bootstrap', 'coffeeLint clean copy coffee requirejs min');
	grunt.registerTask('dev', 'bootstrap watch');

	// deletes the js folder
	// compiles all coffee files
	// starts watching for coffee changes
	//grunt.registerTask('refresh', 'clean coffee watch');

	// starts watching for coffee changes
	//grunt.registerTask('default', 'coffee watch');
};