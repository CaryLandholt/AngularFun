({
	baseUrl: '../',
	mainConfigFile: '../main.js',
	name: 'main',
	out: '../scripts.min.js',
	preserveLicenseComments: false,
	paths: {
		requireLib: 'libs/require'
	},
	include: ['requireLib'],
	findNestedDependencies: true
})