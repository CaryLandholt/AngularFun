###global define###

define ['services/services'], (services) ->
	'use strict'

	services.factory 'messageService', ['$rootScope', ($rootScope) ->
		publish: (name, parameters) ->
			parameters.timeStamp = new Date()

			$rootScope.$emit(name, parameters)
		subscribe: (name, listener) ->
			$rootScope.$on(name, listener)
	]