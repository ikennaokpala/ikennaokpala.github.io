---
author: 'Ikenna Okpala'
comments: true
date: 2009-11-18 00:45:19
layout: post
slug: unix-ps-command
title: 'Unix "PS" command '
wordpress_id: 75
categories:
- MAC
- UNIX
- WICKET
---

Today, i meet a senior colleague in the field of software named [JOE WALNES](http://joewalnes.com/).

While i was showing Joe what i had done earlier today with [WICKET](http://wicket.apache.org/).

I was unable to run the my small [WICKET](http://wicket.apache.org/) app, because tomcat was still running, and i was unable to  shutdown the tomcat instance that i had earlier on started on my MAC Book.

<!--more-->
He simply opened my eyes to the PS command on unix systems.

The PS command showes the unique id and related information of the currently running processes on the computer.

Since tomcat is java based and uses a bootstrap to run, he also exposed me to the "JPS" command.

This performs a similar function like the PS command, only selects processes that are java based.

This blog post i hope would be useful to someone out there and also serve as a reminder in case i need to come back to this in the future.

By issuing the PS command it generates a unique id for the system alone, so take note that the ID for processes vary from system to system, so when you apply the "kill" command remember to append the immediate ID of the process you want to shutdown.
