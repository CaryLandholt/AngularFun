###global define###

define ['directives/directives', 'libs/text!directives/templates/tab.html', 'directives/tabs'], (directives, template) ->
	'use strict'

	directives.directive 'tab', [->
		link = (scope, element, attrs, controller) ->
			controller.addTab scope, attrs.tabId

		link: link
		replace: true
		require: '^tabs'
		restrict: 'E'
		scope:
			caption: '@'
		template: template
		transclude: true
	]