---
author: 'Ikenna Okpala'
comments: true
date: 2013-05-15 01:23:58
layout: post
slug: install-teradata-odbc-for-ruby-development
title: Install Teradata ODBC for Ruby development
published: true
categories:
- TERADATA
- RUBY
- LINUX
- UBUNTU
tags:
- TERADATA
- RUBY
- LINUX
- UBUNTU
---

**To install Teradata for ruby development, first it is advisable to install it on a 32 bit linux based VM.**

  *** Given the above, the following steps should work ok:***

  - Download the teradata CLIv2 and ODBC Driver from [http://downloads.teradata.com/download](http://downloads.teradata.com/download)

  -  Download Teradata's Ruby native access interface from [http://sourceforge.net/projects/rubycli/](http://downloads.teradata.com/download)

<!--more-->

  - Install RPM:
    {% codeblock install RPM lang:bash %}
      sudo apt-get install rpm
    {% endcodeblock %}

   - Open up the cliv2:

    {% codeblock install teradata rubycli lang:bash %}
      tar -xvf  cliv2_LINUX_indep.14.00.00.07.tar.gz
    {% endcodeblock %}

   - Change directory  and Install cliv2:

    {% codeblock install teradata rubycli lang:bash %}
      sudo rpm -ivh --nodeps cliv2-14.00.00.07-1.noarch.rpm
    {% endcodeblock %}

   - Change directory to tdicu:

    {% codeblock install teradata rubycli lang:bash %}
       sudo rpm -ivh --nodeps tdicu-14.00.00.00-1.noarch.rpm
    {% endcodeblock %}

   - Change directory to TeraGSS and install:
    {% codeblock install teradata rubycli lang:bash %}
      sudo rpm -ivh --nodeps TeraGSS_linux_x64-14.00.02.07-1.noarch.rpm
    {% endcodeblock %}

   - Open up tdodbc:

    {% codeblock install teradata rubycli lang:bash %}
      tar -xvf tdodbc__linux_indep.14.00.00.04-1.tar.gz
    {% endcodeblock %}

   - Change dorectory to tdodbc:

    {% codeblock install teradata rubycli lang:bash %}
      sudo rpm -ivh --nodeps tdodbc-14.00.00.04-1.noarch.rpm
    {% endcodeblock %}

NB: tdodbc may also contain tdicu and TeraGSS you may want to ignore these as you may have already installed them.

  - Change directory to rubycli-1.0.0 and run the following commands:
    {% codeblock install teradata rubycli lang:bash %}
      make unix && ruby setup.rb install
    {% endcodeblock %}

  - Add these paths to your .zshrc or .bashrc or .bash_profile files

    {% codeblock install teradata rubycli lang:bash %}
    #export LD_LIBRARY_PATH=/opt/teradata/client/14.00/lib
    export COPLIB=/opt/teradata/client/14.00/lib
    export COPERR=/opt/teradata/client/14.00/lib
    export LD_LIBRARY_PATH=/opt/teradata/client/14.00/tbuild/lib:/opt/teradata/client/14.00/lib
    {% endcodeblock %}

   - Finally download or obtain the the 32bit version of the following files:
    bteq, fastload, fexp, mload, ppcmain

    {% codeblock install teradata rubycli lang:bash %}
    sudo mkdir -p  /opt/teradata/client/14.00/bin
    #copy files from where you have downloaded them to
    sudo cp -R bin/* /opt/teradata/client/14.00/bin
    sudo chown -R root:root /opt/teradata/client/14.00/bin/*
    sudo chmod +x /opt/teradata/client/14.00/bin/*
    {% endcodeblock %}

NB: Check that all the dependencies for each of the bin stubs are present.
example:

    {% codeblock install teradata rubycli lang:bash %}
      ldd fexp
    {% endcodeblock %}

You may observe that the libpm.so file 32 bit version is not present, so you then copy the file like this:

  {% codeblock install teradata rubycli lang:bash %}
  cp /path to /client/14.00/lib/libpm.so /opt/teradata/client/14.00/lib
  {% endcodeblock %}

After this you should be rarring and ready to go.