---
author: 'Ikenna Okpala'
comments: true
date: 2011-11-01 00:09:44
layout: post
slug: upgrading-ruby-to-1-9-3-via-rvm
title: Upgrading Ruby to 1.9.3 via RVM
wordpress_id: 892
categories:
- RUBY
- RVM
---

With Ruby [1.9.3](http://www.ruby-lang.org/en/news/2011/10/31/ruby-1-9-3-p0-is-released/) out ! One can only expect [better things](http://www.rubyinside.com/ruby-1-9-3-preview-1-released-5229.html).
<!--more-->

I tried to install 1.9.3 via ruby's version manager [RVM](http://beginrescueend.com/) with this command:
{% highlight bash %}
rvm list known
rvm update
rvm install 1.9.3
{% endhighlight %}
But got no favorable response. After going through the rvm website docs. This combination did the trick:
{% highlight bash %}
rvm get head
rvm reload
rvm install 1.9.3
{% endhighlight %}
