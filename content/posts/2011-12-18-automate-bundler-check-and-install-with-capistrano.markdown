---
author: 'Ikenna Okpala'
comments: true
date: 2011-12-18 23:27:43
layout: post
slug: automate-bundler-check-and-install-with-capistrano
title: Automate Bundler (Check and Install) with Capistrano
wordpress_id: 1007
categories:
- CAPISTRANO
- RUBY
---

I mistakenly emptied my RVM gemset which affected all the gems that where stored within.

{% highlight bash %}
/usr/local/rvm/rubies/ruby-1.9.2-p290/lib/ruby/site_ruby/1.9.1/rubygems/dependency.rb:247:in `to_specs': Could not find bundler (>= 0) amongst [] (Gem::LoadError)
{% endhighlight %}

<!--more-->
I then looked through my Capistrano script and went like this can be automated.
After googling i found [this](http://pivotallabs.com/users/chad/blog/articles/1208-automating-bundler-in-your-deploy) but not quite what i had in mind

After hacking around with maroon 5 playing in the background, on a very cool winter afternoon.. i finally landed at this:


{% highlight ruby %}

namespace :deploy do
  desc "Install bundler"
  task :bundle_install do
    begin
      run "bundle install"
    rescue
      gem_install_bundler
    end
  end

  desc "installs Bundler if it is not already installed"
  task :gem_install_bundler, :roles => :app do
    run "gem install bundler && bundle install"
  end
end
{% endhighlight %}

You can override to include this in deploy:cold as well like this:

{% highlight ruby %}

namespace :deploy do
  task :cold do
    update
    bundle_install
  end
  desc "Install bundler"
  task :bundle_install do
    begin
      run "bundle install"
    rescue
      gem_install_bundler
    end
  end

  desc "installs Bundler if it is not already installed"
  task :gem_install_bundler, :roles => :app do
    run "gem install bundler && bundle install"
  end
end
{% endhighlight %}

Yes i am aware i am breaking the rules here.. please lets discuss below.. Drop me a line. :)
