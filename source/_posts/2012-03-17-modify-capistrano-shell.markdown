---
author: 'Ikenna Okpala'
comments: true
date: 2012-03-17 23:53:15
layout: post
slug: modify-capistrano-shell
title: Modify Capistrano shell
wordpress_id: 1368
categories:
- BASH
- CAPISTRANO
- RUBY
- UNIX
---

I remember a while back i [tweeted](https://twitter.com/#!/kengimel/statuses/152549051076837377) and [tweeted](https://twitter.com/#!/kengimel/status/152210894733062144) :( for some help with understanding why cap shell was different from the user's ssh shell.

Glad that now i finally came in contact with some way to modify the cap shell to use the same environment variables as SSH or login shell.

<!--more-->
Simply by adding in the deploy.rb file and you are done:

{% highlight bash %}

set :default_shell, "bash -l"
{% endhighlight %}

The `-l`flag will simply help to load the login shell properly rather than omit it.
