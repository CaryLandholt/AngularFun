(function () {
require({
	"shim": {
		"libs/angular-resource.min": {
			"deps": [
				"libs/angular.min"
			]
		},
		"libs/angular-route.min": {
			"deps": [
				"libs/angular.min"
			]
		},
		"app": {
			"deps": [
				"libs/angular.min",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"controllers/gitHubController": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"controllers/personController": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"controllers/personDetailsController": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"controllers/searchHistoryController": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"directives/tab": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"directives/tabs": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"filters/twitterfy": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"interceptors/dispatcher": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"routes": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"run": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"services/gitHubService": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"services/messageService": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"services/personService": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		},
		"views": {
			"deps": [
				"libs/angular.min",
				"app",
				"libs/angular-resource.min",
				"libs/angular-route.min"
			]
		}
	}
}, [
	"require",
	"controllers/gitHubController",
	"controllers/personController",
	"controllers/personDetailsController",
	"controllers/searchHistoryController",
	"directives/tab",
	"directives/tabs",
	"filters/twitterfy",
	"interceptors/dispatcher",
	"routes",
	"run",
	"services/gitHubService",
	"services/messageService",
	"services/personService",
	"views"
], function (require) {
	angular.element(this.document).ready(function () {
		require(['bootstrap']);
	});
});
}).call(this);