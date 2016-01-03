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
  ```bash
      sudo apt-get install rpm
  ```

   - Open up the cliv2:

    ```bash
      tar -xvf  cliv2_LINUX_indep.14.00.00.07.tar.gz
    ```

   - Change directory  and Install cliv2:

    ```bash
      sudo rpm -ivh --nodeps cliv2-14.00.00.07-1.noarch.rpm
    ```

   - Change directory to tdicu:

    ```bash
       sudo rpm -ivh --nodeps tdicu-14.00.00.00-1.noarch.rpm
    ```

   - Change directory to TeraGSS and install:
    ```bash
      sudo rpm -ivh --nodeps TeraGSS_linux_x64-14.00.02.07-1.noarch.rpm
    ```

   - Open up tdodbc:

    ```bash
      tar -xvf tdodbc__linux_indep.14.00.00.04-1.tar.gz
    ```

   - Change dorectory to tdodbc:

    ```bash
      sudo rpm -ivh --nodeps tdodbc-14.00.00.04-1.noarch.rpm
    ```

NB: tdodbc may also contain tdicu and TeraGSS you may want to ignore these as you may have already installed them.

  - Change directory to rubycli-1.0.0 and run the following commands:
    ```bash
      make unix && ruby setup.rb install
    ```

  - Add these paths to your .zshrc or .bashrc or .bash_profile files

    ```bash
    #export LD_LIBRARY_PATH=/opt/teradata/client/14.00/lib
    export COPLIB=/opt/teradata/client/14.00/lib
    export COPERR=/opt/teradata/client/14.00/lib
    export LD_LIBRARY_PATH=/opt/teradata/client/14.00/tbuild/lib:/opt/teradata/client/14.00/lib
    ```

   - Finally download or obtain the the 32bit version of the following files:
    bteq, fastload, fexp, mload, ppcmain

    ```bash
    sudo mkdir -p  /opt/teradata/client/14.00/bin
    #copy files from where you have downloaded them to
    sudo cp -R bin/* /opt/teradata/client/14.00/bin
    sudo chown -R root:root /opt/teradata/client/14.00/bin/*
    sudo chmod +x /opt/teradata/client/14.00/bin/*
    ```

NB: Check that all the dependencies for each of the bin stubs are present.
example:

    ```bash
      ldd fexp
    ```

You may observe that the libpm.so file 32 bit version is not present, so you then copy the file like this:

  ```bash
  cp /path to /client/14.00/lib/libpm.so /opt/teradata/client/14.00/lib
  ```

After this you should be rarring and ready to go.
