---
author: 'Ikenna Okpala'
comments: true
date: 2011-12-05 00:32:37
layout: post
slug: capistrano-permissions-are-too-open-private-key-will-be-ignored
title: 'Capistrano: “Permissions are too open … private key will be ignored”'
wordpress_id: 991
categories:
- BASH
- CAPISTRANO
- RUBY
- UNIX
---

While trying to login to a remote server with my .ssh credentials on it.. i notice capistrano's warning:


{% highlight bash %}

** [out ::domain.com] @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 ** [out :: domain.com] @         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
 ** [out :: domain.com] @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 ** [out :: domain.com] Permissions 0755 for '~/.ssh/id_rsa' are too open.
 ** [out :: domain.com] It is recommended that your private key files are NOT accessible by others.
{% endhighlight %}

The problem being that my ssh private key was then public rather than private.

To Fix:

<!--more-->
{% highlight bash %}

chmod 600 ~/.ssh/id_rsa

#or you could also do

chmod a-rwx ~/.ssh/id_rsa
chmod u+rw ~/.ssh/id_rsa
{% endhighlight %}
