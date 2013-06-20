do (angular) ->
	'use strict'

	class Tab
		constructor: ($log) ->
			Tab::link = (scope, element, attrs, controller) ->
				controller.addTab scope, attrs.tabId

			return {
				link: Tab::link
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