# AngularFun [![Version][version-image]][version-url] [![Build Status][build-image]][build-url] [![Dependency Status][dependencies-image]][dependencies-url] [![License][license-image]][license-url]
> An [AngularJS](http://angularjs.org/) large application Reference Architecture

The intent is to provide a base for creating your own AngularJS applications with minimal boilerplate setup and ceremony.

Simply follow the patterns and you'll get a complete development workflow, including:

* file organization
* transpilation of [CoffeeScript](http://coffeescript.org/) files (*if you prefer plain JavaScript, see [JS Love](#js-love)*)
* transpilation of [LESS](http://lesscss.org/) files
* transpilation of [Jade](http://jade-lang.com/) files
* packages retrieved by [Bower](http://bower.io/)
* three build configurations
	* **build** - compilation with no optimizations
	* **default** or **dev** - compilation with no optimizations but includes file watching to monitor changes and build changed files on-the-fly
	* **prod** - compilation with all optimizations, including concatenation and minification of png, JavaScript, CSS, and HTML files.
* full dependency management (file loading and dependency resolution)
* a unit testing strategy
* a server to run the application


## Table of Contents
* [Installing](#installing)
* [Compiling](#compiling)
* [JS Love](#js-love) - prefer JavaScript over CoffeeScript?
* [Running](#running)
* [Making Changes](#making-changes)
* [Testing](#testing)
* [Commentary](#commentary)
* [Contributing](#contributing)
* [Changelog](#changelog)
* [License](#license)


## Installing
Before running, you must install and configure the following one-time dependencies:

* [Git](http://git-scm.com/)
* [Node.js](http://nodejs.org/)
* [Grunt](http://gruntjs.com/) - use the terminal command below
```bash
$ npm install -g grunt-cli
```
* [karma](https://github.com/karma-runner/karma) - For Windows machines, you may need to install [karma](https://github.com/karma-runner/karma) globally.  Use the terminal command below
```bash
$ npm install -g karma
```

Once the dependencies have been installed, enter the following commands in the terminal:
```bash
$ git clone git@github.com:CaryLandholt/AngularFun.git
$ cd AngularFun
$ npm install
```


## Compiling
You have options.

1. `grunt build` - will compile the app preserving individual files (when run, files will be loaded on-demand)
2. `grunt` or `grunt dev` - same as `grunt build` but will launch the app, watch for file changes, recompile on-the-fly, and livereload the browser
3. `grunt prod` - will compile using optimizations.  This will create one JavaScript file and one CSS file to demonstrate the power of [r.js](http://requirejs.org/docs/optimization.html), the build optimization tool for RequireJS.  And take a look at the index.html file.  Yep - it's minified too.
4. `grunt test` - will compile the app and run all unit tests


## JS Love
Some of you prefer working with plain old JavaScript.  We've got ya covered.  Simply run the following grunt task.
`grunt jslove` - will transpile all of the CoffeeScript files to JavaScript and throw out the Coffee.


## Running
1. Compile the app using one of the above three options.  `grunt` and `grunt dev` will run the web server and open the app in your default browser automatically.
2. `grunt serve` or `grunt server` - will run the web server and open the app in your default browser.


## Making Changes
* `grunt` and `grunt dev` will watch for any .coffee, .less, .jade, or .html file changes.  When changes are detected, the files will be linted, compiled, and ready for you to refresh the browser.


## Testing
`grunt test` - Runs unit tests using the [Karma](http://karma-runner.github.io/) Test Runner


## Commentary
AngularFun is a by-product of my learning AngularJS and became the reference architecture to my day job project, a very large internally and externally-facing application with extensive user interactions.

I needed something that could support our Architecture Principles, including scale, stability, and maintenance.

My background with using [RequireJS](http://requirejs.org/), see the [RequireJS screencasts](http://www.youtube.com/watch?v=VGlDR1QiV3A&list=PLCBD579A7ADB6313A) on my [YouTube channel](http://www.youtube.com/user/carylandholt), enabled me to get up and running with managing many individual files right away.  RequireJS is a terrific dependency management technology.


### Take 1
Here's an early example controller in CoffeeScript.

```coffee
define ['controllers/controllers', 'services/gitHubService'], (controllers) ->
	controllers.controller 'gitHubController', ['$scope', '$location', 'gitHubService', ($scope, $location, gitHubService) ->
		$scope.search = (searchTerm) ->
			$location.path "/github/#{searchTerm}"

		$scope.onRouteChange = (routeParams) ->
			$scope.searchTerm = routeParams.searchTerm

			gitHubService.get $scope.searchTerm
			, (repos) ->
				$scope.repos = repos
	]
```

There are a couple things going on here.  RequireJS is loading controllers/controllers and services/gitHubService and providing a handle to both.
The controllers module was an early attempt at organizing AngularJS functionality into separate AngularJS modules (i.e. controllers, services, directives, filters, and responseInterceptors).
This ultimately provided no benefit, so I got rid of them.  They were just noise.


### Take 2
Using only one AngularJS module and rewriting the above script without the functionality-specific AngularJS container modules we have:

```coffee
define ['libs/angular', 'services/gitHubService'], (angular) ->
	angular.module('app').controller 'gitHubController', ['$scope', '$location', 'gitHubService', ($scope, $location, gitHubService) ->
		$scope.search = (searchTerm) ->
			$location.path "/github/#{searchTerm}"

		$scope.onRouteChange = (routeParams) ->
			$scope.searchTerm = routeParams.searchTerm

			gitHubService.get $scope.searchTerm
			, (repos) ->
				$scope.repos = repos
	]
```

As you can see, I now had to bring in a reference to libs/angular.  This *was* a dependency for controllers/controllers.

Let's now focus on the gitHubService dependency.  The file needs to be loaded, of course, but RequireJS doesn't need to provide a handle to it since AngularJS will do that part.  Notice there's no gitHubService parameter in the define callback.

But something just didn't sit well with me.  RequireJS will load dependent files and provide a handle to them beautifully; however, AngularJS has its own dependency management system.  But there is a difference.

AngularJS does not load dependent files, but it will provide a handle to them once they *are* loaded.  RequireJS does both.

So the define function is making sure AngularJS is loaded and provides a handle to it, even though it's a global variable.  It also makes sure gitHubService is loaded but doesn't need to provide a handle since the AngularJS dependency management system will do this.

Even though there is a difference, there is some overlap in responsibility here.  This can be observed with the mere fact that there is a gitHubService dependency referenced in the define function as well as the controller function.  So the developer has to work in the RequireJS world and AngularJS world in the same file.


### Take 3

So I decided to refactor the files and remove RequireJS completely, at least from the individual files.

Now we have:

```coffee
angular.module('app').controller 'gitHubController', ['$scope', '$location', 'gitHubService', ($scope, $location, gitHubService) ->
	$scope.search = (searchTerm) ->
		$location.path "/github/#{searchTerm}"

	$scope.onRouteChange = (routeParams) ->
		$scope.searchTerm = routeParams.searchTerm

		gitHubService.get $scope.searchTerm
		, (repos) ->
			$scope.repos = repos
]
```

To me, this just feels better.  The file contains only AngularJS business.  Albeit, I did choose to use a single AngularJS application module called **app** and accept the use of the angular global variable.

So if we've removed RequireJS from the files, how do we load the files to let AngularJS do its thing?

I really don't care for including multiple script references in the index.html file, such as:

```html
<!-- angular must load first -->
<script src="/scripts/libs/angular.js"></script>

<!-- angular dependencies must load next -->
<script src="/scripts/libs/angular-resource.js"></script>
<script src="/scripts/app.js"></script>
<script src="/scripts/services/messageService.js"></script>
<script src="/scripts/services/gitHubService.js"></script>
<script src="/scripts/controllers/gitHubController.js"></script>
<!-- ... more scripts -->

<!-- bootstrap must load last -->
<script src="/scripts/bootstrap.js"></script>
```

Although this may be suitable for some, I'm not comfortable with ensuring load order by where the script references are placed (the angular script reference must precede angular-resource, for example).  I prefer to be more prescriptive than that.
And we also need to concatenate and minify the scripts for our prod build.  We could grep the script references, concatenate, and then minify.  We could try out [Yeoman](http://yeoman.io/).  This all seemed a bit heavy-handed.

This is where the RequireJS [shim](http://requirejs.org/docs/api.html#config-shim) configuration comes in.

Since we no longer have dependencies referenced in individual files by way of RequireJS, and the multiple script reference idea is unappealing, we can define our dependencies inside our main file using shim.  Notice the dependencies can be referenced in any order.  RequireJS will ensure dependencies are loaded prior to their being required.

```coffee
require
	shim:
		'controllers/gitHubController': deps: ['libs/angular', 'app', 'services/gitHubService']
		'libs/angular-resource': deps: ['libs/angular']
		'services/gitHubService': deps: ['libs/angular', 'app', 'libs/angular-resource', 'services/messageService']
		'services/messageService': deps: ['libs/angular', 'app']
		'app': deps: ['libs/angular', 'libs/angular-resource']
		'bootstrap': deps: ['libs/angular', 'app']
	[
		'require'
		'controllers/gitHubController'
	], (require) ->
		require ['bootstrap']
```

The bootstrap file is requested within the callback since it must load last.

Now we only need a single script reference inside index.html.

```html
<script data-main="/scripts/main.js" src="/scripts/libs/require.js"></script>
```

So what about concatenation and minification?

Since we're only using RequireJS to manage load order, we can leverage the RequireJS optimizer to concatenate and minify too.  And once the files are concatenated and minified to a single file, we no longer need RequireJS.  This is perfect for our prod build.

We do, however, need to introduce a condition in index.html to use the non-optimized files or the optimized files based on the build environment.  The build will do it for us.

Here are the final index.html script references.  Note that the condition will not be part of the final output.

```html
<% if (config.environment === 'prod') { %>
	<script src="/scripts/scripts.min.js"></script>
<% } else { %>
	<script data-main="/scripts/main.js" src="/scripts/libs/require.js"></script>
<% } %>
```


### Take 4
Inspired by [tardyp](https://github.com/tardyp) and his [grunt-requiregen](https://github.com/tardyp/grunt-requiregen) plugin - what if we didn't have to do anything?

So that's actually where we are.  The shim file from [Take 3](#take-3) is built for you.

Whew!


## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md)


## Changelog
See [CHANGELOG.md](CHANGELOG.md)


## License
See [LICENSE](LICENSE)


[build-image]:            http://img.shields.io/travis/CaryLandholt/AngularFun.svg?style=flat
[build-url]:              http://travis-ci.org/CaryLandholt/AngularFun

[dependencies-image]:     http://img.shields.io/gemnasium/CaryLandholt/AngularFun.svg?style=flat
[dependencies-url]:       https://gemnasium.com/CaryLandholt/AngularFun

[license-image]:          http://img.shields.io/badge/license-MIT-blue.svg?style=flat
[license-url]:            LICENSE

[version-image]:          http://img.shields.io/github/tag/CaryLandholt/AngularFun.svg?style=flat
[version-url]:            https://github.com/CaryLandholt/AngularFun/tags