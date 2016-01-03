---
author: 'Ikenna Okpala'
comments: true
date: 2009-08-11 00:18:00
layout: post
slug: 2002-cant-connect-to-local-mysql-server-through-socket-varmysqlmysql-sock
title: 2002 – Can’t connect to local MySQL server through socket ‘/var/mysql/mysql.sock’
wordpress_id: 44
categories:
- DATABASE
- MAC
- NETBEANS
- UNIX
- WEB DEVELOPMENT
---

Today, i stopped being a fan of MAMP for integrating PHP Apache and MYSQL, and i decided to setup Apache, MYSQL and PHP stack on my MAC OS X 10.5.7 (leopard) the good old way...

But, i encountered this error: 2002 - Can't connect to local MySQL server through socket '/var/mysql/mysql.sock' (2).


Wow... i then discovered funny enough, that MYSQL instance was running perfectly and i was able to connect MYSQL

<!--more-->



via the MYSQL Admin GUI tool.










I made a lucky guess asserting, that the PHP config file may be missing some info, Hmmm...










Well the solution goes as follows:










I searched for "mysql.lock" and i discovered that the MYSQL Socket file was located in "/tmp/mysql.lock.










Also, in the my PHP.ini file the value for "mysql.default_socket" was entirely empty "".










ehhhh... Run this command in Terminal to view hidden files "defaults write com.apple.finder AppleShowAllFiles TRUE" and then followed by "killall Finder".










Then Go to "private/etc/PHP.ini". (note: private is a hidden folder).










If prior to this, in "private/etc/ "folder, the PHP.ini file does not exist copy and paste it there first.










Now open the PHP.ini file with say BBedit or TextWrangler.










Use command + F to find "mysql.default_socket" and paste "/tmp/mysql.sock" as it's new value.










Finally restart your Apache web server with Terminal using "sudo apachectl graceful".










After restart, PHP will be able to make connection calls to MYSQL with no further a do or hassle.



