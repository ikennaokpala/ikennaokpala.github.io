---
author: 'Ikenna Okpala'
comments: true
date: 2011-03-18 11:36:27
layout: post
slug: emacs-scala-and-ensime-configuration-steps
title: 'Emacs (starter-kit and emacs for Mac OSX), Scala and Ensime Configuration
  steps '
wordpress_id: 829
categories:
- EMACS
- ENSIME
- SCALA
---

_(Before starting with this i think you may want to delete the~/.emac, ~/.emacs.d or ~/.emacs~ files from you computer, if they already exit. this is just my view.. reason being that the settings in the .emacs file.. i noticed overshadowed the settings in the emacs start-kit version.)_

NB: Note that, this is [my cloned copy](https://github.com/kengimel/emacs-dotfiles) and is specific to my system and user name.
<!--more-->

This post aims to guide you through the steps and get you setup based on [my cloned copy](https://github.com/kengimel/emacs-dotfiles).

To get cracking with this, type the following on the terminal: clone this git repo with the following:
{% highlight bash %}
git clone git@github.com:kengimel/emacs-dotfiles.git .emacs.d
ln -s .emacs.d emacs.d
cd emacs.d
{% endhighlight %}
next rename ikenna.el to your username on a mac that will be you shortname: the command below will give you the current username

{% highlight bash %}
 whoami    # this will return to tell you your current username
 mv kengimel.el yourusername.el
{% endhighlight %}
next rename kengimel.el to you system name, this can be gotten by typing:
{% highlight bash %} hostname                # this will return to tell you your current hostname / system name
 mv ikenna.el yourhostname.el
{% endhighlight %}
Sometimes the hostname may appear verbose use this command to rename it, if you rename it don't to repeat the step above:

{% highlight bash %}
 scutil --set HostName yournewhostname
{% endhighlight %}
NB: you have to restart your machine for this to take effect

Next:
{% highlight bash %}
 git submodule init
 git submodule update
{% endhighlight %}

The commands above will update the ensime submodule for the project:

Next download and install [emacs for Mac OSX](http://emacsformacosx.com/).
{% highlight bash %}
 cd vendor/ENSIME
 sbt update               # this may take a little while to come through
 sbt dist
 Stop existing ENSIME server by killing inferior-ensime-server buffer
 Restart ENSIME with M-x ensime
 M-x ensime-sbt #gives you ensime sbt goodness
 M-x eshell #gives you the already embedded command line terminal
{% endhighlight %}
Next open Applications folder and click Emacs.app to start emacs for Mac (You may notice that ensime will throw an error, don't worry just carry out the next steps below)

C-x C-f (control-x and control-f) and open the file with you system name Locate this line (i guess this will be around line number 151) (add-to-list 'load-path (concat dotfiles-dir "/vendor/ENSIME/elisp")) and edit it to this (add-to-list 'load-path (concat dotfiles-dir "/vendor/ENSIME/dist/elisp"))

DOWNLOAD SETUP THE FOLLOWING EMACS MODES:
[NXML-MODE](http://www.thaiopensource.com/download/)
[AUTO-COMPLETE MODE](http://cx4a.org/software/auto-complete/#Downloads)

I advice to first try out your installation by debugging it with this command;
{% highlight bash %}
 emacs --debug-init
{% endhighlight %}

And now you ready to start writing some wonderful concise scala code with the help of emacs ENSIME. kudos to the guys behind the emacs starter kit, [technomancy](https://github.com/technomancy), [george agnelli](https://github.com/g-eorge/), [ topfunky](https://github.com/topfunky) and [aemon cannon](https://github.com/aemoncannon/).


ROCK ON !
