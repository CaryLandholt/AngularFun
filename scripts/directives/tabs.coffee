###global define###

define ['use!angular', 'directives/directives', 'text!templates/tabs.html'], (angular, directives, template) ->
	'use strict'

	directives.directive 'ngTabs', [->
		restrict: 'E'
		transclude: true
		scope: {}
		
		controller: ($scope, $element) ->
			tabs = $scope.tabs = []

			$scope.select = (tab) ->
				angular.forEach tabs, (tab) ->
					tab.selected = false

				tab.selected = true

			this.addTab = (tab) ->
				$scope.select tab if tabs.length is 0
				tabs.push tab

		template: template
		replace: true
	]