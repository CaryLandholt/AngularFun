# Angular Fun
*By Cary Landholt*

## About
* This is an attempt to play with the features of [AngularJS](http://angularjs.org/) using a structure to support large client-side applications, leverage the goodness of [RequireJS](http://requirejs.org/), [CoffeeScript](http://coffeescript.org/), [LESS](http://lesscss.org/), [Grunt](https://github.com/cowboy/grunt) and [Jasmine](http://pivotal.github.com/jasmine/).
* Demonstrates controllers, services, directives, filters, and partials
* Uses Jasmine to run unit tests
* Uses Grunt to put it all together

## Prerequisites
* Must have [Git](http://git-scm.com/) installed
* Must have [node.js (at least v0.8.1)](http://nodejs.org/) installed with npm (Node Package Manager)
* Must have [CoffeeScript](https://npmjs.org/package/coffee-script) node package installed globally.  `npm install -g coffee-script`
* Must have [Grunt](https://github.com/gruntjs/grunt) node package installed globally.  `npm install -g grunt`

## Install Angular Fun
Enter the following commands in the terminal.
* `git clone git://github.com/CaryLandholt/AngularFun.git`
* `cd AngularFun`
* `npm install`

## Compile Angular Fun
You have three options.

1. `grunt` - will compile the app preserving individual files (when run, files will be loaded on-demand)
2. `grunt dev` - same as `grunt` but will watch for file changes and recompile on the fly
3. `grunt prod` - will compile using optimizations.  This will create one JavaScript file and one CSS file to demonstrate the power of [r.js](http://requirejs.org/docs/optimization.html), the build optimization tool for RequireJS.  And take a look at the index.html file.  Yep - it's minified too.

## Run It
* Navigate to the root of the project
* `grunt server`
* Open the [app](http://localhost:3005/) in your browser to run the app

## Making Changes
* `grunt dev` will watch for any CoffeeScript (.coffee), Less (.less), or .template file changes.  When changes are detected, the files will be linted, compiled, and ready for you to refresh the browser.

## Running Tests
You have two options.

1. Jasmine HTML runner
* `grunt`
* Open /test/runner.html to run the unit tests using Jasmine.

2. Testacular - `grunt test` -  Defaults to running the tests in chrome, but you can easily change this in testacular.conf.js browsers section as required.

## To-Do
* Add many more unit tests :(
* Add more documentation :(
* Screencasts :)