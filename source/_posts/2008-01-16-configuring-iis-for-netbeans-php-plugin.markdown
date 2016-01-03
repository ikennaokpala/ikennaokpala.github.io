---
author: 'Ikenna Okpala'
comments: true
date: 2008-01-16 20:17:00
layout: post
slug: configuring-iis-for-netbeans-php-plugin
title: Configuring IIS For NetBeans PHP Plugin
wordpress_id: 31
categories:
- NETBEANS
- SOLUTIONS
---

To install the PHP plugin and create an IIS web server profile:

   1. Check if the PHP plugin is already installed: choose Tools > Plugins and switch to the Installed tab.
   2. If PHP is not on the list of installed plugins, switch to the Available Plugins tab, select the PHP option in the list, and click the Install button.
   3. In the NetBeans IDE main screen, switch to the Services tab, which shows a tree of available databases and web server profiles.

    <!--more-->

   4. Position the cursor on the Web Servers node and from the context menu choose Add Web Server. The Add New Web Server Record dialog box opens.
   5. In the Connection Name text field, enter the name of the web server profile(in this case enter "IIS ADMIN") and from the Server Type drop-down list, choose one of the connection types:
          * Local Web Server with file access. This option assumes that you have a web server installed on your local computer. Every time you run your PHP project, the IDE copies your source files to a specified directory under the web server document root.
          * Remote Web Server with FTP access. This option allows you to deploy your PHP files to a remote web server via FTP.
            Note: In the development environment using a local web server is recommended. Find how to configure FTP access here.
   6. Click Next and choose the Manual Configuration option.
   7. In the Apache config file Location text box, Leave it Blank.
   8. Click Next.
   9. In the Base Directory text field, enter the subfolder of the Document Root where your PHP files will be copied(for IIS 'C:\Inetpub\wwwroot' is the path to IIS root, now create a folder there and use that folder name only in the Base Directory text field with no path pointing to it just the name of the wwwroot subfolder you just created.).
  10. Click Next.
  11. For the Document Root Browse to 'C:\Inetpub\wwwroot' or any sub folders as you wish.
  12. Click Finish.



For More information.. On the Netbeans PHP Plugin [Click here](http://php.netbeans.org/)
