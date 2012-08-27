###global define###

define ['directives/directives', 'libs/text!directives/templates/tab.html', 'directives/tabs'], (directives, template) ->
	'use strict'

	directives.directive 'appTab', [->
		link = (scope, element, attrs, controller) ->
			controller.addTab scope, attrs.tabId

		link: link
		replace: true
		require: '^appTabs'
		restrict: 'E'
		scope:
			caption: '@'
		template: template
		transclude: true
	]