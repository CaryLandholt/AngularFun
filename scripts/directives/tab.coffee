###global define###

define ['directives/directives', 'text!templates/tab.html', 'directives/tabs'], (directives, template) ->
	'use strict'

	directive = ->
		require: '^ngTabs'
		restrict: 'E'
		transclude: true
		scope:
			caption: 'bind'
		link: (scope, element, attrs, controller) ->
			controller.addTab scope
		template: template
		replace: true

	directives.directive 'ngTab', [directive]

	directive