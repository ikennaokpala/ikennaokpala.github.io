---
author: 'Ikenna Okpala'
comments: true
date: 2011-12-27 01:27:33
layout: post
slug: postgres-native-extension-error
title: Postgres gem native extension error
wordpress_id: 1085
categories:
- BASH
- DATABASE
- POSTGRESQL
- RAILS
- RUBY
- UNIX
---

I hit this error when installing the pg gem for using postgresql with rails apps.

<!--more-->
{% highlight bash %}

Gem::Installer::ExtensionBuildError: ERROR: Failed to build gem native extension.

        /Users/userx/.rvm/rubies/ruby-1.9.2-p290/bin/ruby extconf.rb
checking for pg_config... no
No pg_config... trying anyway. If building fails, please try again with
 --with-pg-config=/path/to/pg_config
checking for libpq-fe.h... no
Can't find the 'libpq-fe.h header
*** extconf.rb failed ***
Could not create Makefile due to some reason, probably lack of
necessary libraries and/or headers.  Check the mkmf.log file for more
details.  You may need configuration options.

Provided configuration options:
	--with-opt-dir
	--without-opt-dir
	--with-opt-include
	--without-opt-include=${opt-dir}/include
	--with-opt-lib
	--without-opt-lib=${opt-dir}/lib
	--with-make-prog
	--without-make-prog
	--srcdir=.
	--curdir
	--ruby=/Users/kengimel/.rvm/rubies/ruby-1.9.2-p290/bin/ruby
	--with-pg
	--without-pg
	--with-pg-dir
	--without-pg-dir
	--with-pg-include
	--without-pg-include=${pg-dir}/include
{% endhighlight %}

I already have postgres installed, so what? it appears postgres does not know when to find the its native extension files.

To solve you need to locate bin directory for your postgresql in the Library directory. Depending the version of postgres you are running, the path to the bin folder may differ.

including the below to you .bashrc or .bash_profile or .profile or .zshrc will do the trick :)
{% highlight bash %}

PATH=${PATH}:/Library/PostgreSQL/9.1/bin
source .zshrc
gem install pg
{% endhighlight %}

For centos users [this post](http://serverfault.com/questions/316703/how-to-install-libpq-dev-on-centos-5-5) could be of help.
 and/or
Prepend with a variable assignment for PATH with the location of the pg_config file, for example:

{% highlight bash %}

export PATH=/usr/pgsql-9.1/bin:$PATH
source .bashrc
gem install pg
{% endhighlight %}

Check that postgres is running:

service postgresql-9.1 status

