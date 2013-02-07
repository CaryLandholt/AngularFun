// Testacular configuration


// base path, that will be used to resolve files and exclude
basePath = '';


// list of files / patterns to load in the browser
files = [
  JASMINE,
  JASMINE_ADAPTER,
  './dist/scripts/libs/angular.js',
  './dist/scripts/libs/angular-resource.js',
  './test/scripts/libs/angular-mocks.js',
  './dist/scripts/app.js',
  './dist/scripts/controllers/*.js',
  './dist/scripts/directives/*.js',
  './dist/scripts/filters/*.js',
  './dist/scripts/responseInterceptors/*.js',
  './dist/scripts/services/*.js',

  './test/scripts/filters/*.js',
  './test/scripts/services/*.js'
];


// list of files to exclude
exclude = [];


// test results reporter to use
// possible values: dots || progress
reporter = 'progress';


// web server port
port = 8081;


// cli runner port
runnerPort = 9100;


// enable / disable colors in the output (reporters and logs)
colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;


// enable / disable watching file and executing tests whenever any file changes
autoWatch = true;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari
// - PhantomJS
browsers = ['Chrome'];


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = true;
