###global define, describe, beforeEach, module, it, inject, expect###

define ['libs/angularMocks', 'filters/twitterfy'], ->
	'use strict'

	describe 'twitterfy filter', ->
		beforeEach module 'filters'

		it 'Twitter username should be prepended with the @ sign', inject ['twitterfyFilter', (twitterfy) ->
			twitterHandle = 'CaryLandholt'
			twitterfied = twitterfy twitterHandle

			expect(twitterfied).not.toEqual(twitterHandle)
			expect(twitterfied).toEqual("@#{twitterHandle}")
		]