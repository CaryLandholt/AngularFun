###global define###

define ['directives/directives', 'text!partials/tab.html', 'directives/tabs'], (directives, template) ->
	'use strict'

	directives.directive 'ngTab', [->
		require: '^ngTabs'
		restrict: 'E'
		transclude: true
		scope:
			caption: 'bind'

		link: (scope, element, attrs, controller) ->
			controller.addTab scope

		template: template
		replace: true
	]