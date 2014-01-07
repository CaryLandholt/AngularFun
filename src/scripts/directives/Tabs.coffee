class AppTabs extends Directive
	constructor: ->
		return {
			controller: 'tabsDirectiveController'
			controllerAs: 'controller'
			replace: true
			restrict: 'E'
			scope: {}
			templateUrl: '/views/directives/tabs.html'
			transclude: true
		}