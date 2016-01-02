---
author: 'Ikenna Okpala'
comments: true
date: 2009-08-15 18:45:00
layout: post
slug: gem-mysql-install-problem-on-mac-os-x-leopard
title: '"gem mysql install" problem on Mac OS X (Leopard)'
wordpress_id: 45
categories:
- MAC
- RUBY
- UNIX
---









I executed the db:migrate via netbeans GUI and it threw this error:



{% highlight bash %}


*******************************************************************




* config.breakpoint_server has been deprecated and has no effect. ********************************************************************

{% endhighlight %}



<!--more-->
!!! The bundled mysql.rb driver has been removed from Rails 2.2. Please install the mysql gem and try again: gem install mysql.




rake aborted!





no such file to load -- mysql




And obviously, I went ahead to install the mysql gem
"gem mysql install" and returned this error:



{% highlight bash %}

WARNING:  Installing to ~/.gem since /Library/Ruby/Gems/1.8 and
/usr/bin aren't both writable.
WARNING:  You don't have /Users/ikenna/.gem/ruby/1.8/bin in your PATH,
gem executables will not run.
Building native extensions.  This could take a while...
ERROR:  Error installing mysql:
ERROR: Failed to build gem native extension.

/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby extconf.rb
checking for mysql_query() in -lmysqlclient... no
checking for main() in -lm... yes
checking for mysql_query() in -lmysqlclient... no
checking for main() in -lz... yes
checking for mysql_query() in -lmysqlclient... no
checking for main() in -lsocket... no
checking for mysql_query() in -lmysqlclient... no
checking for main() in -lnsl... no
checking for mysql_query() in -lmysqlclient... no

Gem files will remain installed in /Users/ikenna/.gem/ruby/1.8/gems/mysql-2.7 for inspection.
Results logged to /Users/ikenna/.gem/ruby/1.8/gems/mysql-2.7/gem_make.out


But after googling and trying out so many versions of bash commands, Finally the solution that worked for me came.... thanks to this guy "[**kevin.sylvestre**](http://railsforum.com/profile.php?id=26809)" via the [Railsforum](http://railsforum.com/viewtopic.php?id=33752).


{% endhighlight %}

He stated and i quote:




Before installing the gem you first need the MySQL binaries ([http://dev.mysql.com/downloads/mysql/5.1.html](http://dev.mysql.com/downloads/mysql/5.1.html)). For Mac OS X use the Mac OS X 10.5 (package format) (x86). Then:




{% highlight bash %}
> sudo env ARCHFLAGS="-arch i386" gem install mysql -- \ --with-mysql-dir=/usr/local/mysql --with-mysql-lib=/usr/local/mysql/lib \ --with-mysql-include=/usr/local/mysql/include>


{% endhighlight %}









This solution worked very well for me and i hope this could help someone else... hopefully...




Cheers.





