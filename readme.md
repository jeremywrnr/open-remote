open-remote
===========


[![Gem Version](https://badge.fury.io/rb/open-remote.svg)](https://badge.fury.io/rb/open-remote)
[![Build Status](https://travis-ci.org/jeremywrnr/open-remote.svg?branch=master)](https://travis-ci.org/jeremywrnr/open-remote)
[![MIT](https://img.shields.io/npm/l/alt.svg?style=flat)](http://jeremywrnr.com/mit-license)


open-remote - a simple git remote opening tool. works for:

    - github
    - bitbucket
    - heroku

if there are other git hosting websites that you would like to add, either let
me know or make a pull request with the augmentation for that host.

## setup

    [sudo] gem install open-remote

## usage

    git open-remote

opens the first git remote. to open a specific remote, specify some part (or
all) of the host name. for example:

    git open-remote bit
    git open-remote bucket
    git open-remote bitbucket

will all open the current repository's bitbucket remote in the browser.


## about

the original idea for this came from my friend [charlie][cel] who initially
provided me with a simple git alias that would do the same, but it only worked
for repos that were https and was not platform independent. I was also inspired
by the [git-up][gup] ruby gem in how seamlessly it integrated with git. Here is
the original git alias (made to work on osx), which charlie wrote (plop it in
your .gitconfig, if you don't want to install a ruby gem to open your git
remotes):

```
[alias]
    open-remote = "!open $(git remote -v $@ | grep -o 'http\\S*' | head -1); :"
```

[gup]:
[cel]:

## testing

    bundle || gem install bundler
    rake

## todos

- adding ronn docgen, with rake
- activitaing travisci tracking

