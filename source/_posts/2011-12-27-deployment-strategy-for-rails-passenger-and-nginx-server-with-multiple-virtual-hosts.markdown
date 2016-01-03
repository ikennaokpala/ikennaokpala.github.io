---
author: 'Ikenna Okpala'
comments: true
date: 2011-12-27 05:01:04
layout: post
slug: deployment-strategy-for-rails-passenger-and-nginx-server-with-multiple-virtual-hosts
title: Deployment Strategy for Rails, Passenger and Nginx server with Multiple Virtual
  Hosts
wordpress_id: 1031
categories:
- BASH
- CAPISTRANO
- NGINX
- RAILS
- RUBY
- RVM
- UNIX
---

In this blog post i intend to share notes taken during deployment exercise of rails apps on Multiple Virtual Hosts.

I have decided to put this all down for self reference and possibly interesting debates that may help expose areas that i am not be aware of.

<!--more-->
Deploying rails apps from a beginners perspective (like mine) could be really confusing.

This note will show how i have come to avoid breaking the passenger-nginx compilation and deploying rails apps to Multiple Virtual Hosts.

The development stack/environment is based on the following technologies:




  * Centos


    * Run these commands to find out what version of Centos your server is.


    * `cat /etc/redhat-release` gives me: "CentOS Linux release 6.0 (Final)"


    * `uname -a` gives me: "Linux servername-xxx 2.6.32-71.29.1.el6.x86_64 #1 SMP Mon Jun 27 19:49:27 BST 2011 x86_64 x86_64 x86_64 GNU/Linux"





  * Nginx Web Server


  * RVM 1.10.0


  * Phusion Passenger 3.0.11


  * Ruby 1.9.2 patch level 290


  * Rails 3.1.3


It is worthy of note that at the time of writting this post the urls and rpm are valid. if you encounter any not found kinda error, you can google to find the rpm and the include it to the centos repo file.

{% highlight bash %}
sudo vim /etc/yum.repos.d/CentOS-Base.repo
{% endhighlight %}

**Firstly, before we get started we need to setup the following**

_Setup a deployment user account_
Our rails application will run as user: deployerbot.
To create a deployerbot, allocate it to a group, modify the deployerbot user password and then add deployerbot to sudoers file.

{% highlight bash %}
groupadd staff # if staff does not exist (cat /etc/groups | grep staff)
useradd -m -g staff -s /bin/bash deployerbot # if you need to add deploybot user to more groups  usermod -G grp1,grp2,newgrp username
passwd deployerbot
visudo  # edit to include deployerbot to the sudoers file.. notice that i changed this to visudo instead of vim /etc/sudoers.. this is a safer way to edit sudoers. see this link for more on visudo http://linux.about.com/library/cmd/blcmdl8_visudo.htm.. thanks to Geoff Low (gflow) for the correction..

# include this line below  'root ALL=(ALL) ALL': to enable deployerbot to use the sudo command
deployerbot ALL=(ALL) ALL
#or alternatively add the staff group below  'root ALL=(ALL) ALL': to enable deployerbot to use the sudo command as a member of the group
%staff ALL=(ALL) ALL
#login as the newly created user and create the ssh key
ssh-keygen -t rsa -b 4096
{% endhighlight %}

More on [ssh and its key generation here](http://ubuntuforums.org/showthread.php?t=904796)
Now the web applications are going to run in production-mode, include this line to /etc/environment to avoid repeating it for every kind of Rails like commands:

{% highlight bash %}
RAILS_ENV=production
{% endhighlight %}

_Install RVM _
Make sure you have all the essential armoury (dependencies) :)

{% highlight bash %}
yum groupinstall "Development Tools"  # ubuntu equivalent may be this apt-get install build-essential ruby-full libmagickcore-dev imagemagick libxml2-dev libxslt1-dev git-core ruby-devel libxml2 libxml2-devel libxslt libxslt-devel

yum install kernel-devel kernel-headers # this may already have been installed by default

yum install openssl-devel libcurl-devel ImageMagick httpd-devel ruby-libs zlib-devel libjpeg-devel giflib-devel readline-devel

# or this could also work as well if the above fails

sudo rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-4.noarch.rpm

yum -y install libpcap libpcap-devel libnet libnet-devel pcre pcre-devel gcc automake autoconf libtool make gcc-c++ libyaml libyaml-devel zlib zlib-devel pkgconfig ruby-devel libxml2 libxml2-devel libxslt libxslt-devel
{% endhighlight %}


Check out this [link](http://www.openinfosecfoundation.org/doc/INSTALL.txt) for more information

To Install RVM on Centos this following command is require (do this as the deployment user). Also make sure you already have curl and git installed.

{% highlight bash %}
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm) # after installation, rvm should be ready to use.. if not reboot

rvm notes # to find out if there are any system specific setting that require attention.. for centos you may need to create a .screenrc file with only this as its content shell -/bin/bash

usermod -a -G staff,rvm deployerbot  #modify deployerbot to multiple groups rvm and staff
{% endhighlight %}

For Centos depending on the version you are running on i would advise run the command below for more information

{% highlight bash %}
rvm notes
{% endhighlight %}

_Install Ruby and Upgrade RubyGems_
For precautionary reason install 1.9.2 with the following packages: (do this as the deployment user)

{% highlight bash %}

rvm pkg install readline # you may want to do (--skip-autoreconf) this for each package to avoid autoreconf error: rvm --skip-autoreconf pkg install readline
rvm pkg install zlib
rvm pkg install openssl
rvm install 1.9.2 --with-openssl-dir=$rvm_path/usr --with-readline-dir=$rvm_path/usr # with zlib optional rvm install 1.9.2 --with-zlib-dir=$rvm_path/usr --with-openssl-dir=$rvm_path/usr --with-readline-dir=$rvm_path/usr
rvm use 1.9.2 # to make this the system's ruby do: rvm --default use 1.9.2

# Upgrade RubyGems to the latest (stable) and greatest.. :)
wget http://rubyforge.org/frs/download.php/xxxxx/rubygems-x.x.x*.tgz
tar zxvf rubygems-x.x.x*.tgz
cd rubygems-x.x.x*
ruby setup.rb
# to confirm rubygem upgrade:
gem -v
{% endhighlight %}

_Create a Gemsets for each web application_
This blog focuses on deployment on multiple virtual hosts we will be creating two gemsets demonstration purposes.

{% highlight bash %}
rvm gemset create webapp1
rvm gemset create webapp2
{% endhighlight %}

On the server create a ~/.gemrc file

{% highlight bash %}
:verbose: true
:bulk_threshold: 1000
install: --no-ri --no-rdoc --env-shebang
:sources:
- http://gemcutter.org
- http://gems.rubyforge.org/
- http://gems.github.com
:benchmark: false
:backtrace: false
update: --no-ri --no-rdoc --env-shebang
:update_sources: true
{% endhighlight %}


**
To deploy these apps on Nginx**
_Install and setup passenger and nginx_
Passenger as i have come to know is simply mod_rails pr mod ruby for webservers like nginx.
now here is where i have observed that i made a big mistake. Now because you have multiple virtual host sitting on the server, they are mostly likely not useing the exactly set of gems and even possibly may different rubies.

With RVM installed on the server, your RVM directory is located here "$HOME/.rvm/" probably has taken this form.

{% highlight bash %}
cd $HOME/.rvm/gems/
ls

# archives  environments  help     log        README   tmp      wrappers
# bin       examples      hooks    man        rubies   user
# config    gems          lib      patches    scripts  usr
# contrib   gemsets       LICENCE  patchsets  src      VERSION
{% endhighlight %}

Out of all these we are interested in two folders the gems and wrapper.

A brief look into the gems folder you will find the following

{% highlight bash %}
cd gems
ls

# cache            ruby-1.9.2-p290@webapp1      ruby-1.9.2-p290@webapp2
# ruby-1.9.2-p290  ruby-1.9.2-p290@global
{% endhighlight %}

Because we want to maintain virtual host and accommodate dissimilarities between webapp1 and webapp2

I suggest installing passenger in the ruby-1.9.2-p290 gemset folder. This will avoid breaking passenger on each deployment of any of the two web applications, because for each time you reload or reinstall your gems , there is a big propensity of getting the passenger-nginx link broken. Hence the need to recompile passenger for nignx on the server.

This could also lead to errors like:




  * 500 internal server error


  * 403 Forbidden


  * [Tue Dec 27 22:43:57 2011] [error] *** Passenger could not be initialised because of this error: Unable to start the Phusion Passenger watchdog because it encountered the following error during startup: Unable to start the Phusion Passenger logging agent because its executable (/path/to/gems/passenger-3.0.11/agents/PassengerLoggingAgent) doesn't exist. This probably means that your Phusion Passenger installation is broken or incomplete. Please reinstall Phusion Passenger


So i think it's better to have the passenger gem separate from the gemsets for the web application. This will not require recompiling passenger on every deployment, hence leaving a high chance of downtime problems.

Now i have come across solutions like unicorn, but for now what is obtain in my environment is passenger. Burt will be checking unicorn out pretty soon.

To achieve this do the following (perform this as the deployment user):

{% highlight bash %}
rvm use 1.9.2 # load the ruby-1.9.2-p290 folder into your current session

gem install passenger # this should install passenger to the ruby-1.9.2-p290 folder

passenger-install-nginx-module # do this to setup/compile passenger with nginx
{% endhighlight %}

At a certain stage of the _passenger-install-nginx-module_ you will be asked to chose to between two setup processes. For me i will take the number 1 option of installing nginx from scratch which is the recommended option. This also makes sense since so far we have not installed nginx.

_Nginx Virtual Host Configuration_
For nginx assuming that decided to install it in /etc/nginx/ passenger will locate the nginx.conf in the conf folder. To correctly link passenger and nginx the copy the following to your nginx.conf file

{% highlight bash %}
user  deployerbot staff;

worker_processes  2;

events {
    worker_connections  1024;
}
http {
    passenger_root /usr/local/rvm/gems/ruby-1.9.2-p290/gems/passenger-3.0.11;
    passenger_ruby /usr/local/rvm/wrappers/ruby-1.9.2-p290/ruby;

    include       mime.types;
    default_type  application/octet-stream;

    access_log  /etc/nginx/logs/access.log;
    error_log  /etc/nginx/logs/error.log;

    sendfile        on;
    keepalive_timeout  65;
    include /etc/nginx/conf.d/*.conf;
}

{% endhighlight %}

Before the next steps create the conf.d directory. I personal prefer to keep them inside conf.d. You can chosen to keep yours somewhere else only remember to link it up.

{% highlight bash %}
mkdir conf.d
{% endhighlight %}

Now for webapp1 you want to configure you server something like this

{% highlight bash %}
server {
    # if you're running multiple servers, instead of "default" you should
    # put your main domain name here
    listen 80;

    # you could put a list of other domain names this application answers
    server_name webapp1.com;

    root /var/www/path/to/webapp1/current/public;
    access_log /var/www/path/to/webapp1/logs/webapp1.access.log;
    error_log /var/path/to/webapp1/logs/webapp1.error.log;

    rewrite_log on;

    passenger_enabled on;
}

{% endhighlight %}

And for webapp2 we have

{% highlight bash %}
server {
    # if you're running multiple servers, instead of "default" you should
    # put your main domain name here
    listen 80;

    # you could put a list of other domain names this application answers
    server_name webapp2.com;

    root /var/www/path/to/webapp2/current/public;
    access_log /var/www/path/to/webapp2/logs/webapp2.access.log;
    error_log /var/path/to/webapp2/logs/webapp2.error.log;

    rewrite_log on;

    passenger_enabled on;
}

{% endhighlight %}

Obviously the above steps do not settle it all. We need to create our web app.

{% highlight bash %}
rails new webapp1
rails new webapp2
{% endhighlight %}

Create a ~/.rvmrc to trust your .rvmrc project files and (create) load the project specific gemset

{% highlight bash %}
rvm_trust_rvmrcs_flag=1

if [[ -s "/usr/local/rvm/gems/ruby-1.9.2-p290@webapp1" ]] ; then
  . "/usr/local/rvm/gems/ruby-1.9.2-p290@webapp1"
else
  rvm --create use  "1.9.2@webapp1"
fi
{% endhighlight %}


Here comes another part.

Unlike [Apache's SetEnv feature](http://httpd.apache.org/docs/2.0/mod/mod_env.html), nginx does not allow setting of environment variable rather relies on the shell for environment variables.

Passenger on the other hand is a shel script and will use the default settings of the shell if the rails application does not specify its own settings.

To avoid this problem, you need to set environment variable for each application (webapp1 and webapp2).

To do this edit config/production.rb with the following:

{% highlight ruby %}

WebApp1::Application.configure do
# Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true #..........
# .....................................
end

#paste this at the bottom and edit this part with your own relevant paths

ENV['GEM_HOME']='/usr/local/rvm/gems/ruby-1.9.2-p290@webapp1/gems' # take note for webapp2 it will be /usr/local/rvm/gems/ruby-1.9.2-p290@webapp2/gems
ENV['GEM_PATH']='/usr/local/rvm/gems/ruby-1.9.2-p290@webapp1/gems:/usr/local/rvm/gems/ruby-1.9.2-p290@global/gems'
ENV['PATH']='/usr/local/rvm/gems/ruby-1.9.2-p290@webapp1/bin:$PATH'
ENV['MY_RUBY_HOME']='/usr/local/rvm/wrappers/ruby-1.9.2-p290@webapp1/ruby'
{% endhighlight %}

The above will set the environment variable for the rails application to the gemset folder _/usr/local/rvm/gems/ruby-1.9.2-p290@webapp1/gems_ as well as all others.

Next you need to create a in the config folder setup_load_paths.rb this is well explained in [this post](http://beginrescueend.com/integration/passenger/)
Copy and paste the following:


{% highlight ruby %}
if ENV['MY_RUBY_HOME'] && ENV['MY_RUBY_HOME'].include?('rvm')
  begin
    rvm_path = File.dirname(File.dirname(ENV['MY_RUBY_HOME']))
    rvm_lib_path = File.join(rvm_path, 'lib')
    $LOAD_PATH.unshift rvm_lib_path
    require 'rvm'
    RVM.use_from_path! File.dirname(File.dirname(__FILE__))
  rescue LoadError
    # RVM is unavailable at this point.
    raise "RVM ruby lib is currently unavailable."
  end
end

# Pick the lines for your version of Bundler
# If you're not using Bundler at all, remove all of them

# Require Bundler 1.0
ENV['BUNDLE_GEMFILE'] = File.expand_path('../Gemfile', File.dirname(__FILE__))
require 'bundler/setup'

# Require Bundler 0/9
# if File.exist?(".bundle/environment.rb")
#   require '.bundle/environment'
# else
#   require 'rubygems'
#   require 'bundler'
#   Bundler.setup
# end
{% endhighlight %}

Now last part is the Capistrano recipe to compliment the above setting.

{% highlight bash %}
# First of all create capistrano files with this
capify .
{% endhighlight %}

Following the above copy this part to the Capfile:

{% highlight ruby %}
# this part goes in the Capfile which is located in the root of your rails app

# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# Load RVM's capistrano plugin.
require "rvm/capistrano"
# Set it to the ruby + gemset of your app, e.g:
set :rvm_ruby_string, '1.9.2@webapp1'
{% endhighlight %}
{% highlight ruby %}
#this part goes in the deploy.rb file inside the config in your rails app

require 'bundler/capistrano'
set :application, "webapp1.com"

set :domain, "www.domain.com"
set :environment, "production"
set :branch, "master"
set :deploy_to, "/var/www/path/to/www/webapp1"

role :app, domain
role :web, domain
role :db, domain, :primary => true

default_run_options[:pty] = true

default_run_options[:shell] = 'bash'

default_environment["RAILS_ENV"] = 'production'

set :repository, "git@ domain.com/webapp1.git"
set :deploy_via, :remote_cache

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :scm_verbose, true
set :use_sudo, false
set :ssh_options, :forward_agent => true

set :user, "deployerbot"
set :keep_releases, 7

set :default_environment, {
    'PATH' => "/usr/local/rvm/gems/ruby-1.9.2-p290@webapp1/gems/bin:$PATH",
    'RUBY_VERSION' => 'ruby 1.9.2',
    'GEM_HOME' => '/usr/local/rvm/gems/ruby-1.9.2-p290@webapp1/gems',
    'GEM_PATH' => '/usr/local/rvm/gems/ruby-1.9.2-p290@webapp1/gems:/usr/local/rvm/gems/ruby-1.9.2-p290@global/gems',
    'BUNDLE_PATH' => '//usr/local/rvm/gems/ruby-1.9.2-p290@webapp1/gems' # If using bundler.
}

namespace :deploy do
  desc "restarting"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "symlink vendor to shared vendor"
  task :symlink_vendor_to_shared_vendor do
    run "ln -s #{current_path}/../shared/vendor #{current_path}/vendor"
  end

  desc "trust rvmrc"
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end

after 'deploy:symlink', 'deploy:symlink_vendor_to_shared_vendor', 'deploy:trust_rvmrc'
{% endhighlight %}

Next do

{% highlight bash %}
cap deploy:setup
cap deploy:cold
cap deploy
{% endhighlight %}

On the server you want to load each application's gemset and do bundle install

{% highlight bash %}
rvm use 1.9.2@webapp1
cd /var/www/path/to/www/webapp1
bundle install

rvm use 1.9.2@webapp2
cd /var/www/path/to/www/webapp2
bundle install
{% endhighlight %}

Do keep in mind, that if you start nginx manually, including the sudo -E will inform sudo to preserve your environment. If this is not done, sudo will possibly reset all your environment variables.

{% highlight bash %}
cd /etc/nginx/sbin/
sudo -E ./nginx
{% endhighlight %}


After doing this, nginx is sure to use the your chosen set of configuration.

Here ends the deployment notes, please feel free to comment below.

And away we go ! Ciao for now..
