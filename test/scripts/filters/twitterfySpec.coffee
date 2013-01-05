describe 'twitterfy filter', ->
	beforeEach module 'app'

	it 'Twitter username should be prepended with the @ sign', inject ['twitterfyFilter', (twitterfy) ->
		twitterHandle = 'CaryLandholt'
		twitterfied = twitterfy twitterHandle

		expect(twitterfied).not.toEqual(twitterHandle)
		expect(twitterfied).toEqual("@#{twitterHandle}")
	]