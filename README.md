# Angular Fun
*By Cary Landholt*

## About
* This is an attempt to play with the features of [AngularJS](http://angularjs.org/) and leverage the goodness of [RequireJS](http://requirejs.org/)
* Uses controllers, services, directives, filters, and partials
* No optimization has been performed (i.e. concatenation, minification).  Please see the [RequireJS - Optimizer](http://www.youtube.com/watch?v=m6VNhqKDM4E) screencast for a how-to on RequireJS optimization or the official [RequireJS site](http://requirejs.org/docs/optimization.html).
* Uses the RequireJS [text plugin](http://requirejs.org/docs/api.html#text) for directive partials
* Contains both CoffeeScript and JavaScript versions

## Requirements
* Must have [Git](http://git-scm.com/) installed
* Must have [node.js](http://nodejs.org/) installed with npm (Node Package Manager)
* Install grunt `npm install -g grunt`

## Install Angular Fun
* `git clone git://github.com/CaryLandholt/AngularFun.git`
* `cd AngularFun`
* `npm install`
* `grunt bootstrap`

## Run It
* Navigate to the root of the project
* `node server`

## Making Changes
* `grunt watch` will watch for any CoffeeScript (.coffee) or Less (.less) file changes.  When changes are detected, the files will be linted and compiled.

## To-Do
* Finish documentation