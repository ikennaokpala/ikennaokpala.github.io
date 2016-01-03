---
author: 'Ikenna Okpala'
comments: true
date: 2012-06-08 14:43:50
layout: post
slug: remote-access-to-postgresql-server-14
title: Remote access to PostgreSQL server and Removing Postgres
wordpress_id: 1444
categories:
- BASH
- POSTGRESQL
- UBUNTU
- UNIX
---

This is a very common requirement for remote staging environments.

All that is required is edit postgressql.conf and pg_hba.conf files.

To get going on this it maybe worthy of note to first search for these files.

<!--more-->
{% highlight bash %}

find / -name "postgresql.conf"
{% endhighlight %}

Because locations for these files may differ per operating system (i.e Linux distros)

For this post the location should match Ubuntu/Debian.

For Ubuntu these files are located in "/etc/postgresql/9.1/main" so cd there.

First edit the postgresql.conf, by adding this to the file "listen_addresses = '*'"

{% highlight bash %}
listen_addresses = '*'
{% endhighlight %}

Next stop edit the pg_hba.conf, add the below close to the end of the file.

{% highlight bash %}


host    all             all             0.0.0.0/0               md5{% endhighlight %}

Finally restart postgresql:

{% highlight bash %}

service postgresql restart{% endhighlight %}

OR

{% highlight bash %}

/etc/init.d/postgresql restart{% endhighlight %}


To remove the EnterpriseDB One-Click install of PostgreSQL 9.1:

Open a terminal window

Utilities->Terminal

Run the uninstaller

sudo /Library/PostgreSQL/9.1/uninstall-postgresql.app/Contents/MacOS/installbuilder.sh

If you installed with the Postgres Installer, you can do:

open /Library/PostgreSQL/9.2/uninstall-postgresql.app

It will ask for the administrator password and run the uninstaller.

Remove the PostgreSQL and data folders (Wizard will notify you that these were not removed)

sudo rm -rf /Library/PostgreSQL

Remove the ini file

sudo rm /etc/postgres-reg.ini

Remove the PostgreSQL user

System Preferences -> Users & Groups

Unlock the settings panel by clicking on the padlock and enter your password

Select the PostgreSQL user and click on the minus button.

Restore your shared memory settings

sudo rm /etc/sysctl.conf


