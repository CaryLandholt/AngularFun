angular.module('app').controller 'searchHistoryController', ['$log', '$scope', 'messageService', ($log, $scope, messageService) ->
	$scope.searchHistory = []

	messageService.subscribe 'search', (name, parameters) ->
		$scope.searchHistory.push parameters
]