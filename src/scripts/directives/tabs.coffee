class Controller
	constructor: ($log) ->
		@tabs = []

		@select = (tab) =>
			tab.transcluded = true

			return if tab.selected is true

			angular.forEach @tabs, (tab) ->
				tab.selected = false

			tab.selected = true

		@addTab = (tab) =>
			tab.transcluded = true

			@select tab if @tabs.length is 0
			@tabs.push tab

class Directive
	constructor: ($log) ->
		return {
			controller: ['$log', Controller]
			controllerAs: 'controller'
			replace: true
			restrict: 'E'
			scope: {}
			templateUrl: '/views/directives/tabs.html'
			transclude: true
		}

angular.module('app').directive 'appTabs', ['$log', Directive]