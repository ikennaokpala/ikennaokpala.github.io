---
author: 'Ikenna Okpala'
comments: true
date: 2012-04-11 19:17:43
layout: post
slug: using-homebrew-with-multiple-users-on-a-single-machine
title: Using homebrew with multiple users on a single machine
wordpress_id: 1390
categories:
- BASH
- HOMEBREW
- MAC
- RUBY
- UNIX
---

I a big fan of [homebrew](http://mxcl.github.com/homebrew/). I have been using it for a while now and i am like a lot. But i recent hit a big headache with permission issue with another account on my Mac.

I installed homebrew using a previous user account, but this proved to be very unforgiving to install software from the new user account.

<!--more-->
{% highlight bash %}
brew install redis
Error: Cannot write to /usr/local/Cellar
{% endhighlight %}

The following steps will enable the new user and/or other users to install software with homebrew. BTW thanks for Geoff Low (glow) for helping out.

Firstly set the umask for the user. (inside the .bashrc or .profile or .bash_profile)

{% highlight bash %}
umask 0002 # grant write permission to group
{% endhighlight %}

For more on [umask.](http://www.cyberciti.biz/tips/understanding-linux-unix-umask-value-usage.html)

then recursively grant group write permission to /usr/local directory:
{% highlight bash %}
sudo chmod -R g+w /usr/local/
{% endhighlight %}

then also change recursively /usr/local group to staff:
{% highlight bash %}

sudo chgrp -R staff /usr/local
{% endhighlight %}

Do same for /Library/Caches/Homebrew (optional):
{% highlight bash %}
sudo chmod -R g+w /Library/Caches/Homebrew
sudo chgrp -R staff /Library/Caches/Homebrew
{% endhighlight %}

Alright thats it you should be good to go now with the new user account installing software with homebrew.

Be sure to run and follow any further instructions:
{% highlight bash %}
brew doctor
{% endhighlight %}

NB: It is worthy to note that homebrew by design requires that in your user profile file (i.e. .bashrc or .profile or .bash_profile), that your set /usr/local/bin ahead of /usr/bin to avoid clashes with system software tools that may exist in other paths on your machine. it is important that you override the system paths to use homebrew installations as default.
