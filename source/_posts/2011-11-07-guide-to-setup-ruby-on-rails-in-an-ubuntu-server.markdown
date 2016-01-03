---
author: 'Ikenna Okpala'
comments: true
date: 2011-11-07 13:07:05
layout: post
slug: guide-to-setup-ruby-on-rails-in-an-ubuntu-server
title: Guide to Setup Ruby On Rails in an Ubuntu Server
wordpress_id: 927
categories:
- BASH
- RUBY
- RVM
- UBUNTU
- UNIX
---

Find attached a very imperative guide to setting up ruby on rails Ubuntu. Click the link below.

I found it very useful. :)
[Installation_Ruby-on-Rails_for_Ubuntu-Linux-Mint_www-mirceagoia-com](http://ikennaokpala.files.wordpress.com/2011/11/installation_ruby-on-rails_for_ubuntu-linux-mint_www-mirceagoia-com.pdf)

<!--more-->
However, with Ubuntu you may encounter this problem "no such file to load -- openssl (LoadError)".
With rvm the solution is as follows:


{% highlight bash %}
sudo apt-get install libssl-dev
cd ~/.rvm/src/ruby-1.8.7/ext/openssl
ruby extconf.rb
make && make install
{% endhighlight %}
Also you may encounter errors connected with the readline  extension.
Roll up you sleeve and do :) :

{% highlight bash %}
sudo apt-get install libreadline5-dev
cd ~/.rvm/src/ruby-1.8.7/ext/readline
ruby extconf.rb
make && make install
{% endhighlight %}
