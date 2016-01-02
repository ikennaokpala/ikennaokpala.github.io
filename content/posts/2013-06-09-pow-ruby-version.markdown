---
author: 'Ikenna Okpala'
comments: true
date: 2013-06-09 01:23:58
layout: post
slug: pow-ruby-version
title: Using .ruby-version with pow
published: true
categories:
- RUBY
- RAILS
- POW
tags:
- RUBY
- RAILS
- POW
---

**If you probably upgraded to the latest RVM and you got the message like i did to use ruby-version and ruby-gemset and you bought the idea.. The below helps set parity with the former.**


{% codeblock .powrc lang:ruby %}
  if [ -f "$rvm_path/scripts/rvm" ] && [ -f ".ruby-version" ] && [ -f ".ruby-gemset" ]; then
    source "$rvm_path/scripts/rvm"
    rvm use `cat .ruby-version`@`cat .ruby-gemset`
  fi
{% endcodeblock %}
