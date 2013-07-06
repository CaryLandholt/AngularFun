describe 'twitterfy', ->
	beforeEach module 'app'

	it 'username should be prepended with the @ sign', inject ['twitterfyFilter', (twitterfy) ->
		twitterHandle = 'CaryLandholt'
		twitterfied = twitterfy twitterHandle

		expect(twitterfied).toEqual("@#{twitterHandle}")
		expect(twitterfied).not.toEqual(twitterHandle)
	]