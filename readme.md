open-remote
===========


[![Gem Version](https://badge.fury.io/rb/open-remote.svg)](https://badge.fury.io/rb/open-remote)
[![Build Status](https://app.travis-ci.com/jeremywrnr/open-remote.svg)](https://app.travis-ci.com/jeremywrnr/open-remote)
[![MIT](https://img.shields.io/npm/l/alt.svg?style=flat)](http://jeremywrnr.com/mit-license)


open-remote - a simple git remote opening tool.

tested and works well for:

    - github
    - bitbucket
    - heroku

if there are other git hosting websites that you would like to use this with,
either let me know or make a pull request with the augmentation for that host.


## setup

    [sudo] gem install open-remote

making a git alias for 'git open' in your `.gitconfig`:

    open-remote --alias

removing the alias, if you don't want it anymore:

    open-remote --unalias


## usage

    git open

opens the first listed git remote. to open a specific remote, specify some
of the remote or host name. for example:

    git open bit
    git open bucket
    git open bitbucket

will all open the current repository's bitbucket remote in the browser.
additionally, you can use the remote name to specify which URL to open:

    git open origin

## about

the original idea for this came from my friend [charlie][cel] who initially
provided me with a simple git alias that would do the same, but it only worked
for repos that were https and was not platform independent. I was also inspired
by the [git-up][gup] ruby gem in how seamlessly it integrated with git. Here is
the original git alias (made to work on osx), which charlie wrote (plop it in
your .gitconfig, if you don't want to install a ruby gem to open most of your
git remotes):

```
[alias]
    open-remote = "!open $(git remote -v $@ | grep -o 'http\\S*' | head -1); :"
```

[cel]:https://github.com/clehner
[gup]:https://github.com/aanand/git-up


## testing

    bundle || gem install bundler && bundle
    rake # running open-remote's tests

## todo

    add support for ssb clients:
    "ssb://%3HY71B7em4rZwMwz76yHIJZA1zo5BMBLd7Msh8LRFHI=.sha256"

