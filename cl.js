var placeholders = {
	commitHash: 'H',
	authorName: 'an',
	authorEmail: 'ae',
	authorDate: 'ai',
	committerName: 'cn',
	committerEmail: 'ce',
	committerDate: 'ci',
	subject: 's',
	body: 'b'
};

var separator = '|||||';
var bookend = '<' + separator + '>';

var getFormat = function (segments) {
	var format = bookend + '%' + segments.join(separator + '%') + bookend;

	return format;
};

var formatPlaceholders = [
	placeholders.commitHash,
	placeholders.authorName,
	placeholders.authorEmail,
	placeholders.authorDate,
	placeholders.committerName,
	placeholders.committerEmail,
	placeholders.committerDate,
	placeholders.subject,
	placeholders.body
];

var format = getFormat(formatPlaceholders);
var spawn = require('child_process').spawn;
var revList = spawn('git', ['log', '--no-merges', '--pretty=format:' + format]);
var output = {};

var commitTypes = [
	'feat',
	'fix',
	'docs',
	'style',
	'refactor',
	'test',
	'chore',
	'revert'
];

var trim = function (str) {
	var trimmed = str.replace(/^\s+|\s+$/g, '');

	return trimmed;
};

revList.stdout.on('data', function (data) {
	var raw = data.toString();
	// console.log(raw);
	var logs = raw.split(bookend);

	logs.forEach(function (log) {
		var segments = log.split(separator);

		if (segments.length === 1) {
			return;
		}

		var index = -1;
		var key = segments[++index];

		var details = {
			author: segments[++index],
			authorEmail: segments[++index],
			authorDate: segments[++index],
			committer: segments[++index],
			committerEmail: segments[++index],
			committerDate: segments[++index],
			subject: segments[++index],
			message: segments[++index]
		};

		output[key] = details;
	});
});

revList.stdout.on('end', function (data) {
	var keys = Object.keys(output);

	keys.forEach(function (key) {
		var subject = output[key].subject;
		var message = output[key].message;
		var svnPosition = message.indexOf('\n\ngit-svn-id');
		var svn = message.substr(svnPosition);
		var revisionPosition = svn.indexOf('@') + 1;
		var revision = parseInt(svn.substr(revisionPosition), 10);
		var commitType = null;

		if (svnPosition !== -1) {
			message = message.substr(0, svnPosition);
		}

		message = trim(message);

		var scope = null;

		commitTypes.forEach(function (t) {
			var commitTypePosition = subject.indexOf(t + '(');
			var hasCommitType = commitTypePosition === 0;

			if (hasCommitType) {
				commitType = t;
				subject = subject.substr(t.length);

				var endingParen = subject.indexOf('): ');

				scope = subject.substr(1, endingParen - 1);
				subject = subject.substr(endingParen + 3);
			}
		});

		output[key].scope = scope;
		output[key].type = commitType;
		output[key].subject = subject;
		output[key].message = message;
		output[key].revision = revision;

		// if (!commitType) {
		// 	delete output[key];
		// }
	});

	console.log(JSON.stringify(output, null, '\t'));
});

revList.on('exit', function (code) {
	if (code !== 0) {
		console.log('Failed: ' + code);
	}
});