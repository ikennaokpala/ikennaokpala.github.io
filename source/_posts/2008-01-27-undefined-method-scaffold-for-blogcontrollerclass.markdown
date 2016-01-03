---
author: 'Ikenna Okpala'
comments: true
date: 2008-01-27 04:12:00
layout: post
slug: undefined-method-scaffold-for-blogcontrollerclass
title: undefined method ‘scaffold’ for blogcontroller:class
wordpress_id: 32
categories:
- NETBEANS
- SOLUTIONS
---

If you get this "undefined method 'scaffold' for blogcontroller:class" in your rails application, when you run your application on your browser most likely you were trying out the [Netbeans RubyWeblog Example ](http://www.netbeans.org/kb/60/ruby/rapid-ruby-weblog.html)to solve, follow the steps below:

1. Delete the rubyweblog project from the netbeans project Window. (Also check and make sure you delete "rubyweblog project" from it's  physical location on your hard drive and drop any database previously created in relation to the Netbeans RubyWeblog Example).

<!--more-->

2. Create a rubyweblog_development database, as described below i.e if already have skip to 3.
Open a command window.
If it has not already been started, start the MySQL database server.
Type the following command to create the development database and press Enter.
mysqladmin -u root -p create rubyweblog_development
Note: If the root user does not have a required password, omit the -p argument

3. In the NetBeans IDE, choose File > New Project. Select Ruby in the Categories field and Ruby on Rails Application in the Projects field. Click Next. Type rubyweblog in the Project Name field. Accept all the other default settings. Click Finish to create the new project. The IDE creates the project directory with the same name as your project.

4. In the editing area, edit the database.yml by providing the password in the development configuration. Save and close the database.yml file.

5. Next For rails 2.0 aplications you generate the model, controller, migrate version and views with the following:

_a._ Navigate to your rubyweblog application via commandline Start > Run then type cmd and press enter. i assume your rubyweblog is located at C:\apps\rubyweblog.

_b._Within blog project, right click on your Model folder, click "Generate" and select "Resource" from the menu.You can then place your attributes in the parameters field or alternatively type the following "ruby script\generate scaffold post title:string" in the command line and hit enter, This action generates the model, controller, migrate version and views for you.

6.In the Projects window, right-click the rubyweblog node and choose Migrate Database > To Current Version.This action updates the the database to include the posts table. The Output window indicates when the migration is complete.

7. Under the Configuration node, open routes.rb. Find the line:

# map.connect '', :controller => "welcome"

Edit the line by removing the comment sign (#) using crtl+/ and changing welcome to posts. Expand the Public node, right-click index.html and choose Delete.

Choose File > Save All.
Click the Run Main Project button in the toolbar.

This action starts the WEBrick server, which is part of the Ruby on Rails framework, and launches the web browser. Following is the first page of the application.

Finally continue the [Netbeans RubyWeblog Example "Doing More: Adding Another Field".](http://www.netbeans.org/kb/60/ruby/rapid-ruby-weblog.html#08)
