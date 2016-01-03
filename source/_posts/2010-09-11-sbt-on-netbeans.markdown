---
author: 'Ikenna Okpala'
comments: true
date: 2010-09-11 00:57:43
layout: post
slug: sbt-on-netbeans
title: SBT and Netbeans Terminal Emulator..
wordpress_id: 631
categories:
- NETBEANS
- SBT
- SCALA
---

One of the new features that came bundled with [Netbeans](http://netbeans.org/) 6.9 is the terminal emulator. This provides a shell scripting interface for [Netbeans](http://netbeans.org/) users.

This has been very useful especially with running build tools like maven from the terminal emulator without having to navigate out of the IDE.
<!--more-->

To access this feature, go to 'Window > Output > Terminal. For more on the [Netbeans](http://netbeans.org/) Terminal Emulator click [here](http://wiki.netbeans.org/TerminalEmulator)
[![](http://ikennaokpala.files.wordpress.com/2010/09/screen-shot-2010-09-11-at-02-55-37.png?w=300)](http://ikennaokpala.files.wordpress.com/2010/09/screen-shot-2010-09-11-at-02-55-37.png)

[SBT](http://code.google.com/p/simple-build-tool/) (simple build tool) appears to be one of the raves of the moment, it gradually has grown on me and i am using it in my current project which obviously is Scala based.

At the moment i do not know of any plugin for [SBT](http://code.google.com/p/simple-build-tool/) on the [Netbeans](http://netbeans.org/) platform.

I Initially assumed that having successfully installed [SBT](http://code.google.com/p/simple-build-tool/) on my computer that it would be easily accessible from the terminal emulator. But 'Lo and Behold' the [Netbeans](http://netbeans.org/) terminal emulator was not aware of [SBT](http://code.google.com/p/simple-build-tool/)'s location.

In order to get [SBT](http://code.google.com/p/simple-build-tool/) running in the terminal emulator the following commands would be appropriate, especially for MAC or Unix based PCs and already have [SBT](http://code.google.com/p/simple-build-tool/) running. If you don't have [SBT](http://code.google.com/p/simple-build-tool/) running already click [here](http://code.google.com/p/simple-build-tool/wiki/Setup) to set it up.




{% highlight bash %}


sudo echo "java -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256m -Xmx512M -Xss2M -jar /include/here/path/to/the/sbt-launcher.jar \"\$@\"" | sudo tee /usr/bin/sbt #please don't forget to change the /include/here/path/to/the/sbt-launcher.jar to the relevant path on your system that points to the sbt launcher jar file.

whoami # this would tell you the current user if you already know the name skip this

cd /usr/bin # navigate to the /usr/bin folder

sudo chown username sbt # change owner to the required username on sbt. Also remember to change the username here  to the relevant one on you want to use
or alternatively

sudo chmod u+x sbt # this will give the required operation permission to the user

{% endhighlight %}

After this has been done navigate back to your [Netbeans](http://netbeans.org/) IDE's terminal emulator and type sbt to enjoy it's goodness within the [Netbeans](http://netbeans.org/) IDE.

CIAO for now..






