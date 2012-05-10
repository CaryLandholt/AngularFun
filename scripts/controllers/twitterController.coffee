###global define###

define ['use!angular', 'controllers/controllers', 'text!templates/tweets.html', 'services/twitterService'], (angular, controllers, template) ->
	'use strict'

	getTemplate = ($scope, $compile, template) ->
		wrappedTemplate = '<div>' + template + '</div>'
		element = angular.element wrappedTemplate
		$compile(element) $scope
		$scope.$eval element

		element

	controllers.controller 'twitterController', ['$scope', '$compile', 'twitterService', ($scope, $compile, twitterService) ->
		$scope.searchTerm = ''
		$scope.tweets = twitterService.tweets
		$scope.template = getTemplate $scope, $compile, template

		$scope.changeSearchTerm = (searchTerm) ->
			$scope.searchTerm = searchTerm

		$scope.search = (searchTerm) ->
			$scope.tweets = twitterService.get q: searchTerm

		$scope.changeTemplate = ->
			$scope.template = getTemplate $scope, $compile, '<div data-ng-bind="searchTerm"></div>'
	]