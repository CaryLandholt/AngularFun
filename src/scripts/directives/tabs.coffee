###global define###

define ['libs/angular', 'directives/directives', 'libs/text!directives/templates/tabs.html'], (angular, directives, template) ->
	'use strict'

	directives.directive 'appTabs', [->
		controller = ['$scope', '$element', '$rootScope', ($scope, $element, $rootScope) ->
			$scope.tabs = []

			$scope.select = (tab) ->
				return if tab.selected is true

				angular.forEach $scope.tabs, (tab) ->
					tab.selected = false

				tab.selected = true

			@addTab = (tab, tabId) ->
				$scope.select tab if $scope.tabs.length is 0

				$scope.tabs.push tab

				if tabId
					$rootScope.$on "changeTab##{tabId}", ->
						$scope.select tab
		]

		controller: controller
		replace: true
		restrict: 'E'
		scope: {}
		template: template
		transclude: true
	]