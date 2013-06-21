do (angular) ->
	'use strict'

	class Tab
		constructor: ($log) ->
			link = (scope, element, attrs, controller) ->
				controller.addTab scope, attrs.tabId

			return {
				link
				locals:
					transcluded: '@'
				replace: true
				require: '^appTabs'
				restrict: 'E'
				scope:
					caption: '@'
				templateUrl: '/views/directives/tab.html'
				transclude: true
			}

	angular.module('app').directive 'appTab', ['$log', Tab]