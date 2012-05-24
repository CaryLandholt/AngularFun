###global define###

define ['angular', 'directives/directives', 'text!partials/tabs.html'], (angular, directives, template) ->
	'use strict'

	directives.directive 'ngTabs', [->
		restrict: 'E'
		transclude: true
		scope: {}
		
		controller: ['$scope', '$element', ($scope, $element) ->
			tabs = $scope.tabs = []

			$scope.select = (tab) ->
				angular.forEach tabs, (tab) ->
					tab.selected = false

				tab.selected = true

			this.addTab = (tab) ->
				$scope.select tab if tabs.length is 0
				tabs.push tab
		]

		template: template
		replace: true
	]