/*global module*/

module.exports = function (grunt) {
	'use strict';

	grunt.initConfig({
		pkg: '<json:package.json>',

		meta: {
			banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %> */'
		},

		// deletes the scripts and styles directories
		clean: {
			scripts: {
				dest: '<%= pkg.scripts.build %>'
			},
			styles: {
				dest: '<%= pkg.styles.build %>'
			}
		},

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
			},
			styles: {
				src: '<%= pkg.styles.dev %>',
				dest: '<%= pkg.styles.build %>'
			}
		},

		// compiles CoffeeScript to JavaScript
		coffee: {
			scripts: {
				src: '<%= pkg.scripts.build %>',
				dest: '<%= pkg.scripts.build %>',
				bare: true
			}
		},

		// compiles Less to CSS
		less: {
			styles: {
				src: '<%= pkg.styles.build %>bootstrap.less',
				dest: '<%= pkg.styles.build %>styles.css'
			}
		},

		// concatenates files managed by RequireJS, sans minification
		requirejs: {
			build: {
				baseUrl: './scripts/js/',
				mainConfigFile: './scripts/js/main.js',
				name: 'main',
				out: './scripts/js/scripts.min.js',
				preserveLicenseComments: false,
				paths: {
					requireLib: 'libs/require'
				},
				include: ['requireLib'],
				findNestedDependencies: true,
			}
		},

		/*
		min: {
			scripts: {
				src: ['<banner>', '<%= pkg.scripts.build %>scripts.js'],
				dest: '<%= pkg.scripts.build %>scripts.min.js'
			}
		},
		*/

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
			},
			styles: {
				src: '<%= pkg.styles.build %>**/*.less'
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

		// make a generic copy task to handle files and folders (include in copy task)
		copyFile: {
			index: {
				src: './templates/index.template.html',
				dest: './index.html'
			}
		},

		template: {
			dev: {
				src: './index.html',
				data: {
					environment: 'dev'
				},
				includes: {
					tweets: './scripts/js/partials/tweets.html',
					repos: './scripts/js/partials/repos.html',
					people: './scripts/js/partials/people.html'
				}
			},
			prod: {
				src: '<config:template.dev.src>',
				data: {
					environment: 'prod'
				},
				includes: '<config:template.dev.includes>'
			}
		}
	});

	grunt.loadTasks('tasks');
	grunt.registerTask('reset-index', 'copyFile:index');
	// for some reason, template:dev isn't working, might be a script loader issue
	// maybe related to dom load event
	grunt.registerTask('bootstrap', 'clean coffeeLint copy coffee less requirejs lint prune reset-index template:prod');
	grunt.registerTask('dev', 'bootstrap watch');
	grunt.registerTask('prod', 'bootstrap reset-index template:prod');
};