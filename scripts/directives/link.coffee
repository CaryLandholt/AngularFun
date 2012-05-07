###global define###

define ['directives/directives', 'text!templates/link.html'], (directives, template) ->
	'use strict'

	directive = ->
		replace: true
		restrict: 'E'
		scope:
			url: 'bind'
		template: template
		transclude: true

	directives.directive 'ngLink', [directive]

	directive