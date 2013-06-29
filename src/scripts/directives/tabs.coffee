class Controller
	constructor: ($log, $scope, $element, $rootScope) ->
		$scope.tabs = []

		$scope.select = (tab) ->
			tab.transcluded = true

			return if tab.selected is true

			angular.forEach $scope.tabs, (tab) ->
				tab.selected = false

			tab.selected = true

		@addTab = (tab, tabId) =>
			$scope.select tab if $scope.tabs.length is 0
			$scope.tabs.push tab

			if tabId
				$rootScope.$on "changeTab##{tabId}", ->
					$scope.select tab

class Tabs
	constructor: ($log) ->
		return {
			controller: ['$log', '$scope', '$element', '$rootScope', Controller]
			replace: true
			restrict: 'E'
			scope: {}
			templateUrl: '/views/directives/tabs.html'
			transclude: true
		}

angular.module('app').directive 'appTabs', ['$log', Tabs]