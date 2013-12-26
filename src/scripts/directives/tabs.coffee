class TabsDirective
	constructor: ($log) ->
		return {
			controller: 'tabsDirectiveController'
			controllerAs: 'controller'
			replace: true
			restrict: 'E'
			scope: {}
			templateUrl: '/views/directives/tabs.html'
			transclude: true
		}

angular.module('app').directive 'appTabs', ['$log', TabsDirective]