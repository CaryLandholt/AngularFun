// directives
var directives = angular.module('directives', []);

directives.directive('ngLink', [function () {
	var config = {
		restrict: 'E',
		scope: {
			caption: 'bind',
			url: 'bind'
		},
		replace: true,
		transclude: true,
		templateUrl: 'templates/link.html',
		compile: function (tElement, tAttrs, transclude) {
			return {
				pre: function (scope, iElement, iAttrs, controller) {
					scope.html = transclude(scope).parent().html();
				}
			};
		}
	};

	return config;
}]);

// services
var services = angular.module('services', ['ngResource']);

services.factory('myService', ['$resource', function ($resource) {
	return $resource('scripts/data/people.json', {}, {
		query: {
			method: 'GET',
			isArray: true
		}
	});
}]);

// controllers
var controllers = angular.module('controllers', []);

var firstController = controllers.controller('firstController', ['$scope', 'myService', function ($scope, myService) {
	angular.extend($scope, {
		name: "Cary David Landholt",
		people: myService.query()
	});
}]);

controllers.controller('secondController', ['$scope', function ($scope) {
	angular.extend($scope, {
		name: "Saasha Landholt"
	});
}]);

// app
var myapp = angular.module('myapp', ['directives', 'services', 'controllers']);

// routes
/*
myapp.config(['$routeProvider', function ($routeProvider) {
	$routeProvider
		.when('/first/Cary', {controller: controllers.controller('firstController').invoke});
}]);
*/


angular.element(document).ready(function () {
	angular.bootstrap(document, ['myapp']);
});