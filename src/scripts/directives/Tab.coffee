class AppTabDirective
	constructor: ->
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
				selected: '@'
			templateUrl: '/views/directives/tab.html'
			transclude: true
		}