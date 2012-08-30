# Angular Fun
*By Cary Landholt*

## About
* This is an attempt to play with the features of [AngularJS](http://angularjs.org/) using a structure to support large client-side applications, leverage the goodness of [RequireJS](http://requirejs.org/), [CoffeeScript](http://coffeescript.org/), [LESS](http://lesscss.org/), [Grunt](https://github.com/cowboy/grunt) and [Jasmine](http://pivotal.github.com/jasmine/).
* Demonstrates controllers, services, directives, filters, and partials
* Uses the RequireJS [text plugin](http://requirejs.org/docs/api.html#text) to include directive partials in the minified output to reduce server requests
* Uses Jasmine to run unit tests
* Uses Grunt to put it all together

## Prerequisites
* Must have [Git](http://git-scm.com/) installed
* Must have [node.js (at least v0.8.1)](http://nodejs.org/) installed with npm (Node Package Manager)
* You can skip this step if you wish to run Grunt local to the project - Install the following Node.js modules via the terminal.  This is a one-time task as the `-g` switch will install the modules globally.  `npm install -g grunt`

## Install Angular Fun
Enter the following commands in the terminal.
* `git clone git://github.com/CaryLandholt/AngularFun.git`
* `cd AngularFun`
* `npm install`
* `grunt` or `"./node_modules/.bin/grunt"` to run it local to the project

You are now ready to run the app.
However, if you wish to run the app with optimizations (minification, etc.) turned on, enter the following command in the terminal.
`grunt prod`
This will create one JavaScript file and one CSS file to demonstrate the power of [r.js](http://requirejs.org/docs/optimization.html), the build optimization tool for RequireJS.

## Run It
* Navigate to the root of the project
* `grunt server`

## Making Changes
* `grunt dev` will watch for any CoffeeScript (.coffee), Less (.less), or .template file changes.  When changes are detected, the files will be linted, compiled, and ready for you to refresh the browser.

## Running Tests
* Open /test/runner.html to run the unit tests using Jasmine.

## To-Do
* Add many more unit tests :(
* Add more documentation :(
* Screencasts :)