# Angular Fun
*By Cary Landholt*

## About
* This is an attempt to play with the features of [AngularJS](http://angularjs.org/) and leverage the goodness of [RequireJS](http://requirejs.org/)
* Uses controllers, services, directives, filters, and partials
* No optimization has been performed (i.e. concatenation, minification).  Please see the [RequireJS - Optimizer](http://www.youtube.com/watch?v=m6VNhqKDM4E) screencast for a how-to on RequireJS optimization or the official [RequireJS site](http://requirejs.org/docs/optimization.html).
* Uses the RequireJS [text plugin](http://requirejs.org/docs/api.html#text) for directive partials
* Contains both CoffeeScript and JavaScript versions

## Prerequisites
* Must have [Git](http://git-scm.com/) installed
* Must have [node.js (at least v0.8.1)](http://nodejs.org/) installed with npm (Node Package Manager)
* Install grunt `npm install -g grunt`

## Install Angular Fun
Enter the following commands in the terminal.
* `git clone git://github.com/CaryLandholt/AngularFun.git`
* `cd AngularFun`
* `npm install`
* `grunt bootstrap`

You are now ready to run the app.
However, if you wish to run the app with optimizations (minification, etc.) turned on, enter the following command in the terminal.
`grunt prod`

## Run It
* Navigate to the root of the project
* `node server`

## Making Changes
* `grunt dev` will watch for any CoffeeScript (.coffee), Less (.less), or .template file changes.  When changes are detected, the files will be linted and compiled.

## To-Do
* Finish documentation