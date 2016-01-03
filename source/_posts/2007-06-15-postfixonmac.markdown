---
author: 'Ikenna Okpala'
comments: true
date: 2007-06-15 22:06:00
layout: post
slug: postfixonmac
title: Configuring Postfix on Mac (Local SMTP)
wordpress_id: 13
categories:
- MAC
- POSTFIX
- UNIX
---

During one of my hack trips.. i was required to use postfix capability. Alright i am a newbie to the Unix environment but i learnt this Hack from sniffing around with some luck on my side..

Well i decided to share my thoughts:

i tried a lot of things to try make this work, but the follow i think are the relevant steps.
<!--more-->

Firstly; I did this:
{% highlight bash %}
sudo mate /System/Library/LaunchDaemons/org.postfix.master.plist
{% endhighlight %}
and then added this lines of xml code, add following line before the closing  tag:
{% highlight xml %}
<key>RunAtLoad</key> <true/> <key>KeepAlive</key> <true/>

{% endhighlight %}

then after start service with
{% highlight bash %}
sudo launchctl
launchd% start org.postfix.master
or simply run
sudo postfix start
{% endhighlight %}
Another thing is editing the following files:
{% highlight bash %}
Edit the MAILSERVER=-NO- line in /etc/hostconfig. Change it to read MAILSERVER=-YES-. Save and exit the file.
Open up /etc/postfix/main.cf, and edit these lines to reflect your setup. These are examples from my setup; yours might be different.
LINE 67: myhostname = localhost
LINE 75: mydomain = localhost
LINE 91: myorigin = $mydomain
LINE 105: inet_interfaces = all
LINE 152: mydestination = $myhostname, localhost.$mydomain
LINE 239: mynetworks_style = subnet
LINE 253: mynetworks = 192.168.0.0/23, 127.0.0.0/8
Save your work, and exit the file.
Open up /etc/postfix/master.cf, and uncomment line 77 -- change #smtp inet n - n - - smtpd to smtp inet n - n - - smtpd. Save and exit the file.
{% endhighlight %}

Check that postfix SMTP mock is running:
{% highlight bash %}
telnet localhost 25

{% endhighlight %}
