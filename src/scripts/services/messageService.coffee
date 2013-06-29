class MessageService
	constructor: ($log, $rootScope) ->
		MessageService::publish = (name, parameters) ->
			parameters.timeStamp = Date.now()

			$rootScope.$broadcast name, parameters

		MessageService::subscribe = (name, listener) ->
			$rootScope.$on name, listener

angular.module('app').service 'messageService', ['$log', '$rootScope', MessageService]