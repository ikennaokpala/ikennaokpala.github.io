---
author: 'Ikenna Okpala'
comments: true
date: 2011-12-13 16:55:57
layout: post
slug: amending-git-commits
title: Amending Git commits
wordpress_id: 998
categories:
- BASH
- GIT
- UNIX
---

In my experience with [Git](http://git-scm.com/), i have run into situations where i had made a commit in error, especially when resolving merge conflicts or sometimes i find my commit very non descriptive and need amending.

To remove a commit made in error entirely do:


<!--more-->
{% highlight bash %}

git reset --soft HEAD~1
 # and then
git reset --hard # this will reset the current branch
{% endhighlight %}

Another issue that may arise is, may be you have already push the unwanted change in error to the remote origin branch.
No worries at all, Git is very forgiving.

After you must have done the above steps do this to update (rewind) remote origin.


{% highlight bash %}
git push origin head -f
{% endhighlight %}

To amend commit message i do:


{% highlight bash %}

git commit --amend
{% endhighlight %}

Another scenario where git shines is amending commits.. May be you are working from a new system and have not set the git config --globla user.email to the right email address.
All that is required is running this command:


{% highlight bash %}
git commit --amend --author=username@domain.com
{% endhighlight %}

It all depend on what part of your commit you would like to change. for a full usage guide do:

{% highlight bash %}
git commit --usage

{% endhighlight %}

To stop tracking changes on a commited file do

{% highlight bash %}
git update-index --assume-unchanged <path-to-file>
{% endhighlight %}

if need be to continue tracking changes again run the following command:

{% highlight bash %}
git update-index --no-assume-unchanged <path-to-file>
{% endhighlight %}

At some point there may be a couple of commits that you would like to delete, edit or include, or possibly the commit is branching off irregularly.

No worries this git command will interactively see you through (i advise reading through the messages as you go):

{% highlight bash %}
git rebase -i HEAD~5 # 5 here is the position of the very last commit you want to edit
{% endhighlight %}
Ciao !!
