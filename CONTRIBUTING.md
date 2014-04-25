# Contributing to AngularFun


## Table of Contents
* [Issues](#issues)
* [Pull Requests](#pull-requests)
* [Commit Message Guidelines](#commit-message-guidelines)


## Issues
If you find a bug in the source code or a mistake in the documentation, you can help by submitting an [issue](https://github.com/CaryLandholt/AngularFun/issues) to the repository.  Even better, you can submit a [Pull Request](#pull-requests) with a fix.

Before you submit your issue, search the [archive](https://github.com/CaryLandholt/AngularFun/issues).  Maybe your question was already answered.

If your issue appears to be a bug, and hasn't been reported, open a new issue.  Help to maximize the effort spent fixing issues and adding new features, by not reporting duplicate issues.  Providing the following information will increase the chances of your issue being dealt with quickly:

* **Overview of the issue**      - if an error is being thrown a non-minified stack trace helps
* **Motivation for or Use Case** - explain why this is a bug for you
* **Version(s)**                 - is it a regression?
* **Operating System**           - is this a problem with only Windows?
* **Reproduce the error**        - provide a live example (using [Plunker](http://plnkr.co/edit) or [JSFiddle](http://jsfiddle.net/)) or an unambiguous set of steps.
* **Related issues**             - has a similar issue been reported before?
* **Suggest a Fix**              - if you can't fix the bug yourself, perhaps you can point to what might be causing the problem (line of code or commit)


## Pull Requests
Before you submit your pull request, consider the following guidelines:

* Search for an open or closed [Pull Request](https://github.com/CaryLandholt/AngularFun/pulls) that relates to your submission.  You don't want to duplicate effort.
* Make your changes in a new git branch
```bash
$ git checkout -b my-fix-branch master
```
* Create your patch, **including appropriate test cases**
* In lieu of a formal styleguide, take care to maintain the existing coding style.  Lint your code.
* Run the full test suite, and ensure that all tests pass
* Commit your changes using a descriptive commit message that follows the [Commit Message Guidelines](#commit-message-guidelines) and passes the commit message presubmit hook `validate-commit-msg.js`.  Adherence to the [Commit Message Guidelines](#commit-message-guidelines) is required, because release notes are automatically generated from these messages.
```bash
$ git commit -a
```
  Note: the optional commit `-a` command line option will automatically "add" and "rm" edited files
* Build your changes locally to ensure all the tests pass
```bash
$ grunt test
```
* Push your branch
```bash
$ git push origin my-fix-branch
```
* Send a pull request to `AngularFun:master`
* If changes are suggested then:
	- Make the required updates
	- Re-run the test suite to ensure tests are still passing
	- Rebase your branch and force push to your repository (this will update your Pull Request):
	```bash
	$ git rebase master -i
	$ git push -f
	```

**Thank you for your contribution!**

After your pull request is merged, you can safely delete your branch, and pull the changes from the main (upstream) repository:

* Delete the remote branch on GitHub either through the GitHub web UI or your local shell as follows:
```bash
$ git push origin --delete my-fix-branch
```
* Check out the master branch:
```bash
$ git checkout master -f
```
* Delete the local branch:
```bash
$ git branch -D my-fix-branch
```
* Update your master with the latest upstream version:
```bash
$ git pull --ff upstream master
```


## Commit Message Guidelines
There are very precise rules over how our git commit messages can be formatted.  This leads to **more readable messages** that are easy to follow when looking through the **project history**.  But also, the git commit messages are used to generate the [Changelog](CHANGELOG.md).


### Commit Message Format
Each commit message consists of a **header**, a **body** and a **footer**.  The header has a special format that includes a **[Type](#type)**, a **[Scope](#scope)**, and a **[Subject](#subject)**:

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

Any line of the commit message cannot be longer than 100 characters!  This allows the message to be easier to read using various git tools.

#### Type
Must be one of the following:

* **feat**:      A new feature
* **fix**:       A bug fix
* **docs**:      Documentation only changes
* **style**:     Changes that do not affect the meaning of the code (white-space, formatting, etc.)
* **refactor**:  A code change that neither fixes a bug or adds a feature
* **perf**:      A code change that improves performance
* **test**:      Adding missing tests
* **chore**:     Changes to the build process or auxiliary tools and libraries such as documentation generation

#### Scope
The scope could be anything specifying place of the commit change.  For example `build`, `ci`, etc...

#### Subject
The subject contains a succinct description of the change:

* use the imperative, present tense: "change" not "changed" nor "changes"
* don't capitalize the first letter
* no dot (.) at the end

#### Body
Just as in the **[Subject](#subject)**, use the imperative, present tense: "change" not "changed" nor "changes".  The body should include the motivation for the change and contrast this with previous behavior.

#### Footer
The footer should contain any information about **[Breaking Changes](#breaking-changes)** and is also the place to reference issues that this commit **[Closes](#referencing-issues)**

##### Breaking Changes
All breaking changes have to be mentioned in the footer with the description of the change, justification, and migration notes

```
BREAKING CHANGE: grunt dev task has been deprecated

grunt dev was superfluous

Before:
grunt dev

After:
grunt
```

##### Referencing Issues
Closed bugs should be listed on a separate line in the footer prefixed with the "Closes" keyword like:

```
Closes #123
Closes #589
```