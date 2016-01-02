---
author: 'Ikenna Okpala'
comments: true
date: 2010-08-15 05:02:30
layout: post
slug: automatic-re-start-script-for-tomcat
title: Automatic Re-Start Script for Tomcat
wordpress_id: 483
categories:
- BASH
- JAVA
- JVM
- TOMCAT
- UNIX
---

I noticed only recently that my remote tomcat instance has been frequently shutting down on it's own. This turned out to be very annoying, having to restart tomcat manually almost twice a day.

I queried the web and consulted other resources to seek for possible solutions on how i could detect why my remote tomcat instance goes down and also to re-start it almost immediate.

<!--more-->
I learnt from several articles, documentations on the web and also got useful tips from friends on how to solve this problem. The steps i applied to solving this problem i have included in this blog post and  they are as follows:

First, create a folder and i named it servchk (or you give it any meaningful name you want). I created this folder under root (top-most) directory "/". This folder contains a file which i named chksrv (ie services checker ).


{% highlight bash %}
/servchk/chksrv
mkdir servchk
cd servchk
nano chksrv

{% endhighlight %}


Copy and paste the following to chksrv:


{% highlight bash %}
# !/bin/bash
# Re-start Service - Automatically restart tomcat when it goes bonkers (down)

/bin/netstat -ln | /bin/grep ":8080 " | /usr/bin/wc -l | /bin/awk '{if ($1 == 0) system("/sbin/service tomcat6 start") }'
{% endhighlight %}

Control + O and hit the Return key or enter to save the file and then Control + X to exit nano. (you may choose to use any editor of your choice).

Next i set the permissions for the file. Do this while logged in as root (very important)


{% highlight bash %}
chmod 700 /servchk/chksrv

{% endhighlight %}

Following the above step, is setting up a crontab. The crontab verifies if the tomcat instance is still running, and if the tomcat instance is down it will restart it.


{% highlight bash %}

crontab -l > mycrontab
echo '* * * * * /servchk/chksrv > /dev/null 2>&1' >> mycrontab
crontab mycrontab

#  the above line  will add the following to your crontab:

#  type:
crontab -l
#  to verify the contents of your crontabs list.
{% endhighlight %}



Test the crontab is working by manually stopping tomcat.


{% highlight bash %}
service tomcat6 stop
{% endhighlight %}


Wait for a few seconds to a minute for tomcat to start again.
