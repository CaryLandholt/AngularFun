angular.module('app').directive 'appTab', ['$log', ($log) ->
	link = (scope, element, attrs, controller) ->
		controller.addTab scope, attrs.tabId

	link: link
	replace: true
	require: '^appTabs'
	restrict: 'E'
	scope:
		caption: '@'
	templateUrl: '/views/directives/tab.html'
	transclude: true
]