---
author: 'Ikenna Okpala'
comments: true
date: 2011-11-24 02:25:27
layout: post
slug: set-the-permissions-for-webserver
title: 'Setting the permissions for Webserver '
wordpress_id: 957
categories:
- BASH
- RUBY
- UBUNTU
- UNIX
---

Sometimes when i deploy via tools like ruby's capistrano, there is a certain tendency to get permissions brutally wrong.

and also very easy to encounter the 403 forbidden error "you don't have permission to access on this server"

For apache to render web files, it require read permissions.

<!--more-->
I ran into this and used this commands to resolve the matter: :P

{% highlight bash %}

sudo chmod -R a+rx ~/public_html # this is the web site folder
sudo chmod a+rx ~ # this is current or deployment user home directory

{% endhighlight %}

the first ensures that public_html directory is readable and accessible to all users on the system.

The next command sets current or deployment user's home directory to be readable and accessible to all.

If you add more directories for additional virtual domains later, run that first command again to make sure the new directories are accessible as well.
